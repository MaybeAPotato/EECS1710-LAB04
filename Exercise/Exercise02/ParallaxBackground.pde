class ParallaxBackground {
  public ImageObject[] m_BackGroundArray;
  float m_BackgroundSize = 0.0f;
  public float speed = 6.0f;
  int m_BackgroundIndex = 1;

  ParallaxBackground(String imgName, int size) {
    m_BackGroundArray = new ImageObject[size];

    for (int i = 0; i < size; i++) {
      imageMode(CENTER);
      PVector p = new PVector(width/2, height/2 - (i * height/2), 0);
      PVector r = new PVector(0, 0, 0);
      PVector s = new PVector(width, height, 0);

      m_BackGroundArray[i] = new ImageObject(imgName, p, r, s);
    }

    m_BackgroundSize = m_BackGroundArray[0].img.height;
  }


  void run()
  {
    MoveBackground();
    Parallax();
    draw();
  }

  void MoveBackground()
  {
    for (ImageObject i : m_BackGroundArray)
    {
      i.position.set(i.position.x, i.position.y + speed, i.position.z);
    }
  }

  void Parallax()
  {
    ImageObject bottomBackground = m_BackGroundArray[m_BackgroundIndex];
    ImageObject topBackground = m_BackGroundArray[(m_BackgroundIndex >= m_BackGroundArray.length - 1) ? 0 : m_BackgroundIndex + 1];

    if (height/2 > bottomBackground.position.y)
    {
      if (m_BackgroundIndex < m_BackGroundArray.length - 1)
        m_BackgroundIndex++;
      else
        m_BackgroundIndex = 0;

      m_BackGroundArray[m_BackgroundIndex].position = new PVector(bottomBackground.position.x, bottomBackground.position.y + m_BackgroundSize, 0.0f);
    } 
    else if (height/2 < topBackground.position.y && height/2 > 0)
    {
      m_BackGroundArray[m_BackgroundIndex].position = new PVector(topBackground.position.x, topBackground.position.y - m_BackgroundSize, 0.0f);
    }
  }

  void draw() {
    for (int i = 0; i < m_BackGroundArray.length; i++) {
      imageMode(CENTER);
      m_BackGroundArray[i].draw();
    }
  }
}
