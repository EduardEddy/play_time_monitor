abstract class GuestsDatasource {
  Future list(int attraction, int isActive);
  Future remove(String guestAttractionId);
}
