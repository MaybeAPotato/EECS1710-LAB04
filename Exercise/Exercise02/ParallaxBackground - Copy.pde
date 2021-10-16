class ParallaxBackground{
    public ImageObject[] m_BackGroundArray;
    float m_BackgroundSize = 0.0f;
    public float speed = 12.0f;
    int m_BackgroundIndex = 1;
    
    ParallaxBackground(String imgName, int size){
      m_BackGroundArray = new ImageObject[size];
      
      for(int i = 0; i < size; i++){
        imageMode(CENTER);
        PVector p = new PVector(width/2 + (i * width/2),height/2, 0);
        PVector r = new PVector(0,0,0);
        PVector s = new PVector(width,height,0);
        
        m_BackGroundArray[i] = new ImageObject(imgName, p, r, s);
      }
      
      m_BackgroundSize = m_BackGroundArray[0].img.width;
    }
    
    
    void run()
    {
        MoveBackground();
        Parallax();
        draw();
    }

    void MoveBackground()
    {
        for(ImageObject i : m_BackGroundArray)
        {
            i.position.set(int(i.position.x + (-speed)), i.position.y, i.position.z);
        }


    }

    void Parallax()
    {
        ImageObject rightBackground = m_BackGroundArray[m_BackgroundIndex];
        ImageObject leftBackground = m_BackGroundArray[(m_BackgroundIndex >= m_BackGroundArray.length - 1) ? 0 : m_BackgroundIndex + 1];

        if (width/2 >= rightBackground.position.x)
        {
            if (m_BackgroundIndex < m_BackGroundArray.length - 1)
                m_BackgroundIndex++;
            else
                m_BackgroundIndex = 0;

            m_BackGroundArray[m_BackgroundIndex].position = new PVector(rightBackground.position.x + m_BackgroundSize, rightBackground.position.y, 0.0f);
        }
        else if (width/2 < leftBackground.position.x && width/2 > 0)
        {
            m_BackGroundArray[m_BackgroundIndex].position = new PVector(leftBackground.position.x - m_BackgroundSize, rightBackground.position.y, 0.0f);
        }
    }
    
    void draw(){
      for(int i = 0; i < m_BackGroundArray.length;i++){
        imageMode(CENTER);
        m_BackGroundArray[i].draw();
      }
    }
}
