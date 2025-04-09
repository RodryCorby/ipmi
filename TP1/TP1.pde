
//TP1
//ROD CORBANI 
//COM2
PImage img;
void setup()
{
  size (800, 400);
  img = loadImage("creeper.jpg");
}
void mouseClicked()
{
  println("X:"+mouseX+"|Y:"+mouseY);
}

void draw(){
 
  background (139, 152, 166);
   smooth();
  fill(152, 169, 184);
  ellipse(610,85,430,180);// las luces y sombras de fondo
  noFill();
  fill(161, 191, 220);
  ellipse(610,300,800,480);
  noFill();
  fill(197, 223, 253);
  ellipse(820,170,100,150);
  noFill();
  fill(127, 150, 159);
  ellipse(620,327,300,60);
  image(img,0 , 0, 400, 400);
  stroke(0);
strokeWeight(5);
line(400,0,400,400);//linea de separacion
noStroke();
fill(15, 80, 14);
triangle(575,260,570,340,557,340); //patas trasera
triangle(665,260,670,340,687,340);
rect(626,260,40,60);
rect(574,260,40,60);
noFill();
strokeWeight(2);
stroke(82, 143, 1);
fill(39, 105, 3);
rect(590,200,60,95); //tronco del cuerpo
noStroke();
noFill();
fill(7, 51, 1);
rect(590,281,60,17);
noStroke();
strokeWeight(4.5);
stroke(82, 143, 1);
fill(39, 105, 3);
noStroke();
noFill();
fill(39, 105, 3);
triangle(570,280,570,340,557,340); //patas delanteras
triangle(670,280,670,340,687,340);
rect(630,280,40,60);
rect(570,280,40,60);
stroke(82, 143, 1);
rect(560,90,120,115);//cabeza
noStroke();  
fill(0);
rect(589,115,21,21);//el ojo izquierdo
rect(630,115,21,21);//el ojo derecho
rect(610,140,20,22);//partes de la boca
rect(590,155,60,13);
rect(630,165,20,20);
rect(590,165,20,20);


  }
