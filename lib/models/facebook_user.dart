class FacebookUser {
  final String? name, email, id;

  final FaceBookphotoMode? faceBokkPhotoMoood;

  FacebookUser({this.name, this.email, this.id, this.faceBokkPhotoMoood});
  factory FacebookUser.fromJson(Map<String, dynamic> json) => FacebookUser(
        email: json['url'],
        id: json['id'],
        name: json['name'],
        faceBokkPhotoMoood:FaceBookphotoMode.fromJson(json['picture']['data'] )
      );
}

class FaceBookphotoMode {
  final String? url;
  final int? height, width;

  FaceBookphotoMode({this.url, this.height, this.width});

  factory FaceBookphotoMode.fromJson(Map<String, dynamic> json) =>
      FaceBookphotoMode(
          url: json['url'], width: json['width'], height: json['height']);
}

/* 
{
 "name": "Open Graph Test User",
 "email": "open_jygexjs_user@tfbnw.net",
 "picture": {
   "data": {
     "height": 126,
     "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/8462.jpg",
     "width": 200
   }
 },
 "id": "136742241592917"
} */