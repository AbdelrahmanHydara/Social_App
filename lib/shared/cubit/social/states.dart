abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class DirectionChangeState extends SocialStates {}

class DirectionOnChangeState extends SocialStates {}

// Get User Data
class SocialGetUserDataLoadingState extends SocialStates {}

class SocialGetUserDataSuccessState extends SocialStates {}

class SocialGetUserDataErrorState extends SocialStates
{
  final String error;

  SocialGetUserDataErrorState(this.error);
}

// Change Bottom Nav Bar
class SocialChangeBottomNavBarState extends SocialStates {}

class SocialNavigateProfileScreenState extends SocialStates {}

class SocialNavigatePostScreenState extends SocialStates {}

//Image Picker
class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

// Upload Profile Image
class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

// Upload Cover Image
class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {}

// Update User Profile
class SocialUpdateUserLoadingState extends SocialStates {}

class SocialUpdateUserErrorState extends SocialStates {}

// Create Post
class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

class SocialRemovePostImageState extends SocialStates {}

// Get Posts Data
class SocialGetPostsDataLoadingState extends SocialStates {}

class SocialGetPostsDataSuccessState extends SocialStates {}

class SocialGetPostsDataErrorState extends SocialStates
{
  final String error;

  SocialGetPostsDataErrorState(this.error);
}

// Like Posts
class SocialLikePostsSuccessState extends SocialStates {}

class SocialLikePostsErrorState extends SocialStates
{
  final String error;

  SocialLikePostsErrorState(this.error);
}



