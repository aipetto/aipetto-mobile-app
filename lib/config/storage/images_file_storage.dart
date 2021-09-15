class ImagesFileStorage {
  static Map<dynamic, Object> petProfileImage = {
    'id': 'petProfileImage',
    'folder': 'tenant/:tenantId/pet/profileImage',
    'maxSizeInBytes': 100 * 1024 * 1024,
  };

  static Map<dynamic, Object> userAvatarsProfiles = {
    'id': 'userAvatarsProfiles',
    'folder': 'user/avatars/profile/:userId',
    'maxSizeInBytes': 10 * 1024 * 1024,
    'bypassWritingPermissions': true,
    'publicRead': true,
  };
}