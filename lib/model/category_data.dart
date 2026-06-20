class CategoryData {
  String id;
  String titleEng;
  String titleAr;
  String image;

  CategoryData({
    required this.titleEng,
    required this.titleAr,
    required this.image,
    required this.id,
  });
}

List<CategoryData> categories = [
  CategoryData(
    id: 'general',
    titleEng: 'General',
    titleAr: "عــام",
    image: 'assets/images/category1.png',
  ),
  CategoryData(
    id: 'business',
    titleEng: 'Business',
    titleAr: "تجــارة",
    image: 'assets/images/category2.png',
  ),
  CategoryData(
    id: 'sport',
    titleEng: 'Sport',
    titleAr: "رياضــة",
    image: 'assets/images/category3.png',
  ),
  CategoryData(
    id: 'technology',
    titleEng: 'Technology',
    titleAr: "تكنولوجيــا",
    image: 'assets/images/category4.png',
  ),
  CategoryData(
    id: 'entertainment',
    titleEng: 'Entertainment',
    titleAr: "ترفيــه",
    image: 'assets/images/category5.png',
  ),
  CategoryData(
    id: 'health',
    titleEng: 'Health',
    titleAr: "صحــة",
    image: 'assets/images/category6.png',
  ),
  CategoryData(
    id: 'science',
    titleEng: 'Science',
    titleAr: "علــم",
    image: 'assets/images/category7.png',
  ),
];
