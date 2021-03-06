class Graph {
  public static final int gWidth = 400;
  public static final int gHeight = 200;
  public static final int gScrollWidth = 16;
  public static final int gScrollHeight = 16;
  
  private int xPos;
  private int yPos;
  public HScrollbar scroll;
  public String filename;
  private ArrayList<Integer> dataPoints;
  
  public Graph(int x, int y) {
    xPos = x;
    yPos = y;
    // Position the scrollbar at the bottom of the graph, overlayed.
    scroll = new HScrollbar(xPos, yPos + gHeight - (gScrollHeight / 2), gWidth, gScrollWidth, gScrollHeight);
    dataPoints = new ArrayList<Integer>();
  }
  
  public void loadData() {
    dataPoints = new ArrayList<Integer>();
    String[] lines = loadStrings(filename);
    int max = 0;
    for (int i = 0; i < lines.length; i++) {
      if (Integer.parseInt(lines[i]) > max) {
        max = Integer.parseInt(lines[i]);
      }
    }
    double scale = (double) Graph.gHeight/max;
    for (int i = 0; i < lines.length; i++) {
      dataPoints.add((int) Math.round(scale * Integer.parseInt(lines[i])));
    }
  }
  
  public void showData() {
    fill(0);
    int lowerBound = round(scroll.getPos());
    int upperBound;
    if ((lowerBound + Graph.gWidth) > dataPoints.size()) {
      upperBound = dataPoints.size();
    } else {
      upperBound = lowerBound + Graph.gWidth;
    }
    int j = 0;
    for (int i = round(scroll.getPos()); i < upperBound; i++) {
      rect(j + xPos, yPos + Graph.gHeight, 1, (-1)*dataPoints.get(i));
      j++;
    }
  }
  
  // Getters & Setters.
  public int getX() {
    return xPos;
  }
  public int getY() {
    return yPos;
  }
  public ArrayList<Integer> getData() {
    return dataPoints;
  }
}
