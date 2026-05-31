public static class vectorFunctions {
  public static boolean equals(PVector p1, PVector p2) {
    return (abs(p1.x - p2.x) < 0.001 && abs(p1.y - p2.y) < 0.001);
  }
  
  public static boolean sameDirection(PVector p1, PVector p2) {
    return equals(p1.copy().normalize(), p2.copy().normalize());
  }
}
