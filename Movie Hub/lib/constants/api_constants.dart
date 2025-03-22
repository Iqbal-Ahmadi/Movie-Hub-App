class ApiConstant {
  static const Bearer_Token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZTBmYmY4OGRmMzhkNmZkNTU3MmYyMjExMjIyZDU4NiIsIm5iZiI6MTczNDgwMjc4MC4wOTYsInN1YiI6IjY3NjZmZDVjODdiOTJhNDNiZTVlMjgxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oi7HRaVjVb33StqxuuFXvx7Dt5EEkn-tjC1aNt9WEnU';
  static const Api_Key = '5e0fbf88df38d6fd5572f2211222d586';
  static const Base_Url = 'https://api.themoviedb.org/3/';
  static const Map<String, String> header = {
    'Authorization': 'Bearer $Bearer_Token',
    'accept': 'application/json'
  };
}
