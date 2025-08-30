void setup(){
  size(800, 600);
  background(0, 255, 255);
}


void draw(){

  //Head
  int headRadius = 100;
  int headDiameter = 2*headRadius;
  int headCenterX = width/2;
  int headCenterY = height/2;
  
  fill(255, 128, 0);
  
  ellipse(headCenterX, headCenterY, headDiameter, headDiameter);
  
  
  //Mouth
  int mouthOffset = 75;
  int mouthDiameter = headDiameter - mouthOffset;
  float mouthSideTeethYOffset = headCenterY + circumference(mouthDiameter/2, mouthDiameter/4, false);
  
  fill(255, 255, 255);
  
  arc(headCenterX, headCenterY, mouthDiameter, mouthDiameter, 0, PI);
  line(headCenterX + mouthDiameter/2, headCenterY, headCenterX - mouthDiameter/2, headCenterY);
  line(headCenterX, headCenterY, headCenterX, headCenterY + mouthDiameter/2);
  line((float)headCenterX + mouthDiameter/4, (float)headCenterY, (float)headCenterX + mouthDiameter/4, mouthSideTeethYOffset);
  line((float)headCenterX - mouthDiameter/4, (float)headCenterY, (float)headCenterX - mouthDiameter/4, mouthSideTeethYOffset);
  
  
  //Eyes
  int eyeballHeight = 50;
  int eyeballWidth = eyeballHeight/2;
  int pupilScale = 4;
  
  ellipse(headCenterX + headDiameter/8, headCenterY - headDiameter/4, eyeballWidth, eyeballHeight);
  ellipse(headCenterX - headDiameter/8, headCenterY - headDiameter/4, eyeballWidth, eyeballHeight);
  
  fill(0, 0, 0);
  
  ellipse(headCenterX + headDiameter/8, headCenterY - headDiameter/4, eyeballWidth/pupilScale, eyeballHeight/pupilScale);
  ellipse(headCenterX - headDiameter/8, headCenterY - headDiameter/4, eyeballWidth/pupilScale, eyeballHeight/pupilScale);
  
  
  fill(255, 128, 128);
  
  //Nose
  int noseDiameter = 25;
  
  arc(headCenterX, headCenterY - headDiameter/7, noseDiameter, noseDiameter, 0, PI);
  line(headCenterX + noseDiameter/2, headCenterY - headDiameter/7, headCenterX - noseDiameter/2, headCenterY - headDiameter/7);
  noFill();
  arc(headCenterX - noseDiameter/4, headCenterY - headDiameter/7 + noseDiameter/2, noseDiameter/2, (3*noseDiameter)/4, 0, (3*PI)/4);
  arc(headCenterX + noseDiameter/4, headCenterY - headDiameter/7 + noseDiameter/2, noseDiameter/2, (3*noseDiameter)/4, PI/4, PI);
  
  fill(255, 128, 0);
  
  //Ears
  float ear1FinalVertexX = triangleThirdVertexX(headCenterX - headDiameter/8, headCenterX - (3*headDiameter)/8, true);
  float ear1FinalVertexY = triangleThirdVertexY(headCenterY - circumference(headDiameter/2, headDiameter/8, true), headCenterY - circumference(headDiameter/2, (3*headDiameter)/8, false), false);
  float ear2FinalVertexX = triangleThirdVertexX(headCenterX + headDiameter/8, headCenterX + (3*headDiameter)/8, true);
  float ear2FinalVertexY = triangleThirdVertexY(headCenterY - circumference(headDiameter/2, headDiameter/8, true), headCenterY - circumference(headDiameter/2, (3*headDiameter)/8, false), false);
  
  triangle(headCenterX - headDiameter/8, headCenterY - circumference(headDiameter/2, headDiameter/8, false), headCenterX - (3*headDiameter)/8, headCenterY - circumference(headDiameter/2, (3*headDiameter)/8, false), ear1FinalVertexX, ear1FinalVertexY);
  triangle(headCenterX + headDiameter/8, headCenterY - circumference(headDiameter/2, headDiameter/8, false), headCenterX + (3*headDiameter)/8, headCenterY - circumference(headDiameter/2, (3*headDiameter)/8, false), ear2FinalVertexX, ear2FinalVertexY);
  
  
 //Whiskers
 int whiskerOffset = 20;
 int whiskerLength = 50;
 
 line(headCenterX - (3*mouthDiameter)/2 + headDiameter/2, headCenterY, headCenterX - (3*mouthDiameter)/2 + headDiameter/2 - whiskerLength, headCenterY);
 line(headCenterX - (3*mouthDiameter)/2 + headDiameter/2, headCenterY - whiskerOffset, headCenterX - (3*mouthDiameter)/2 + headDiameter/2 - whiskerLength, headCenterY - whiskerOffset - whiskerLength/2);
 line(headCenterX - (3*mouthDiameter)/2 + headDiameter/2, headCenterY + whiskerOffset, headCenterX - (3*mouthDiameter)/2 + headDiameter/2 - whiskerLength, headCenterY + whiskerOffset + whiskerLength/2);
 line(headCenterX + (3*mouthDiameter)/2 - headDiameter/2, headCenterY, headCenterX + (3*mouthDiameter)/2 - headDiameter/2 + whiskerLength, headCenterY);
 line(headCenterX + (3*mouthDiameter)/2 - headDiameter/2, headCenterY - whiskerOffset, headCenterX + (3*mouthDiameter)/2 - headDiameter/2 + whiskerLength, headCenterY - whiskerOffset - whiskerLength/2);
 line(headCenterX + (3*mouthDiameter)/2 - headDiameter/2, headCenterY + whiskerOffset, headCenterX + (3*mouthDiameter)/2 - headDiameter/2 + whiskerLength, headCenterY + whiskerOffset + whiskerLength/2);
}


//Returns a height from an x value on a horizontal diameter to the same x value on the circumference of a circle  
public static float circumference(float radius, float diameterXPos, boolean bottomHalf){
  int switchHalf = 1;
  
  if (bottomHalf){
    switchHalf = -1;
  }
  
  return (float)(switchHalf*Math.sqrt(Math.pow(radius, 2) - Math.pow(diameterXPos, 2)));
}


//returns the x value of the third vertex of an equilateral triangle given 2 other vertices (doesn't completely work)
public static float triangleThirdVertexX(float vertex1, float vertex2, boolean changeVertex){
  
  int switchVertex = -1;
  float sqrt3 = (float)Math.sqrt(3);
  
  if (changeVertex){
    switchVertex = 1;
  }
  
  return (vertex1 + vertex2 + switchVertex*sqrt3*(vertex2 - vertex1))/2;
}


//returns the y value of the third vertex of an equilateral triangle given 2 other vertices (doesn't completely work)
public static float triangleThirdVertexY(float vertex1, float vertex2, boolean changeVertex){
  
  int switchVertex = 1;
  float sqrt3 = (float)Math.sqrt(3);
  
  if (changeVertex){
    switchVertex = -1;
  }
  
  return (vertex1 + vertex2 + switchVertex*sqrt3*(vertex2 - vertex1))/2;
}
