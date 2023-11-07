import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/Profile/profile_screen.dart';
import 'package:social_app/modules/chats/chats_screen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/post/posts_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/constants/constant.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  var dateTime = DateFormat('yyyy/MM/dd – kk:mm').format(DateTime.now());

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController textController = TextEditingController();

  String text = "";

  bool isRTL = false;

  onDirectionChange(isRTL)
  {
    this.isRTL = isRTL;
    emit(DirectionChangeState());
  }

  onChanged(value)
  {
    text = value;
    emit(DirectionOnChangeState());
  }

  UserModel? userModel;
  PostModel? postModel;

  getUserData() async
  {
    emit(SocialGetUserDataLoadingState());

    FirebaseFirestore.instance.
    collection('users').
    doc(uId).
    get().
    then((value)
    {
      userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialGetUserDataSuccessState());
    }).
    catchError((error)
    {
      emit(SocialGetUserDataErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens =
  [
    const FeedsScreen(),
    const ChatsScreen(),
    const PostScreen(),
    const UsersScreen(),
    const ProfileScreen(),
  ];

  List<String> titles =
  [
    'Home',
    'Chats',
    'Add Post',
    'Users',
    'Profile',
  ];

  changeBottomNavBar(int index)
  {
    emit(SocialChangeBottomNavBarState());
    if (index == 2)
    {
      emit(SocialNavigatePostScreenState());
    } else
    // } else if (index == 4)
    // {
    //   emit(SocialNavigateProfileScreenState());
    // } else
    {
      currentIndex = index;
      emit(SocialChangeBottomNavBarState());
    }
  }

  // Image Picker
  var picker = ImagePicker();

  File? profileImage;

  Future<void> getProfileImage() async
  {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else
    {
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else
    {
      emit(SocialCoverImagePickedErrorState());
    }
  }

  // Upload Profile Image
  uploadProfileImage({
  required String username,
  required String bio,
  required String phone,
  }) async
  {
    emit(SocialUpdateUserLoadingState());

    await firebase_storage.FirebaseStorage.instance.
    ref().
    child('users/${Uri.file(profileImage!.path).pathSegments.last}').
    putFile(profileImage!).
    then((value)
    {
      value.ref.getDownloadURL().
      then((value)
      {
        // emit(SocialUploadProfileImageSuccessState());
        updateUser(
          username: username,
          bio: bio,
          phone: phone,
          image: value,
        );
      }).
      catchError((error)
      {
        emit(SocialUploadProfileImageErrorState());
      });
    }).
      catchError((error)
      {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  // Upload Profile Cover
  uploadCoverImage({
    required String username,
    required String bio,
    required String phone,
  }) async
  {
    emit(SocialUpdateUserLoadingState());

    await firebase_storage.FirebaseStorage.instance.
    ref().
    child('users/${Uri.file(coverImage!.path).pathSegments.last}').
    putFile(coverImage!).
    then((value)
    {
      value.ref.getDownloadURL().
      then((value)
      {
        // emit(SocialUploadCoverImageSuccessState());
        updateUser(
          username: username,
          bio: bio,
          phone: phone,
          cover: value,
        );
      }).
      catchError((error)
      {
        emit(SocialUploadCoverImageErrorState());
      });
    }).
    catchError((error)
    {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  // Update User Data
  updateUser({
    required String username,
    required String bio,
    required String phone,
    String? image,
    String? cover,
})
  {
    UserModel model = UserModel(
      username: username,
      bio: bio,
      phone: phone,
      cover: cover??userModel!.cover,
      image: image??userModel!.image,
      email: userModel!.email,
      uId: userModel!.uId,
    );

    FirebaseFirestore.instance.
    collection('users').
    doc(userModel!.uId).update(model.toMap()).
    then((value)
    {
      getUserData();
    }).
    catchError((error)
    {
      emit(SocialUpdateUserErrorState());
    });
  }

  // Create Post Image
  File? postImage;

  Future<void> getPostImage() async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else
    {
      emit(SocialPostImagePickedErrorState());
    }
  }

  // Upload Post Image
  void uploadPostImage({
    required String text,
    required String dateTime,

  }) async
  {
    emit(SocialCreatePostLoadingState());

    await firebase_storage.FirebaseStorage.instance.ref()
        .child('posts ${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value)
    {
      value.ref.getDownloadURL().
      then((value)
      {
        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error)
      {
        emit(SocialCreatePostErrorState());
      });
    })
        .catchError((error)
    {
      emit(SocialCreatePostErrorState());
    });
  }

  // Create Post
  createPost({
    required String dateTime,
    String? postImage,
    required String text,
  }) async
  {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      username: userModel!.username,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
      dateTime: dateTime,
      postImage: postImage??'',
    );

    await FirebaseFirestore.instance.
    collection('posts').
    add(model.toMap()).
    then((value)
    {
      emit(SocialCreatePostSuccessState());
    }).
    catchError((error)
    {
      emit(SocialCreatePostErrorState());
    });
  }

 // Remove Post Image
 removePostImage()
 {
   postImage = null;
   emit(SocialRemovePostImageState());
 }

 // Get Posts Data
 List<PostModel> posts = [];
 List<String> postId = [];
 List<int> likes = [];

 getPostData()
 {
   emit(SocialGetPostsDataLoadingState());

   FirebaseFirestore.instance.
   collection('posts').
   get().then((value)
   {
     for (var element in value.docs)
     {
       element.reference.
       collection('likes').
       get().
       then((value)
       {
         likes.add(value.docs.length);
         postId.add(element.id);
         posts.add(PostModel.fromJson(element.data()));
       }).catchError((error) {});
     }
     emit(SocialGetPostsDataSuccessState());
   }).catchError((error)
   {
     emit(SocialGetPostsDataErrorState(error.toString()));
   });
 }

 // Like Post
 likePost(String postId)
 {
   FirebaseFirestore.instance.
   collection('posts').
   doc(postId).
   collection('likes').
   doc(userModel!.uId).
   set({
     'like' : true,
   }).
   then((value)
   {
     emit(SocialLikePostsSuccessState());
   }).
   catchError((error)
   {
     emit(SocialLikePostsErrorState(error.toString()));
   });
 }

}


