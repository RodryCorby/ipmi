//Rodrigo Corbani Comision 1
//Variables

PImage fondo1, fondo2, fondo3, PNG;
PFont Fuente;
int pantalla = 1,textoX1 = 640,textoY2 = 480,textoX3 = 0, contadorFrames = 0;
boolean textoCentrado3 = false, Boton = false;
String texto1 = "LEGO Star Wars: The Complete Saga es un videojuego de acción y aventura desarrollado por Traveller's Tales y publicado por LucasArts. Fue lanzado en 2007, esta basado en los Episodios I, II, III, IV, V y VI)";
String texto2 ="Resumen:\n Episodio I: Un niño llamado Anakin es descubierto por los Jedi.\n Dicen que puede traer equilibrio a la Fuerza.\n Episodio II: Anakin crece, se enamora de Padmé y comienza\n una gran guerra con ejércitos de clones.\n Episodio III: Anakin se vuelve malo, se convierte en Darth Vader\n y ayuda a crear el Imperio. Padmé muere al tener\n gemelos: Luke y Leia.\n Episodio IV: Luke crece sin saber quién es su padre.\n Se une a los rebeldes y destruye la Estrella de la Muerte\n del Imperio.\n Episodio V: Luke entrena como Jedi. Darth Vader\n le dice que es su padre. Los rebeldes pierden.\n Episodio VI: Luke salva a su padre del lado oscuro.\n El Emperador muere. El Imperio es derrotado. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        TODO ESTO EN VERSION LEGO!!";
String texto3 = "Plataformas:\nDisponible originalmente en PlayStation 2, PlayStation 3, Xbox 360, \n Wii, Nintendo DS, PC, y más tarde en dispositivos móviles.";

void setup() {
size(640, 480);
textSize(16);
textLeading(22);
frameRate(60);
fondo1 = loadImage("Fondo_1.jpg");
fondo2 = loadImage("Fondo_2.jpg");
fondo3 = loadImage("Fondo_3.jpg");
PNG = loadImage("Titulo.png");
Fuente = loadFont("MNewsGothic-Bold-48.vlw");
textFont(Fuente, 18);
textLeading(22);
}

void draw() {
  //pantalla-1
if (pantalla == 1) {
image(fondo1, 0, 0, width, height);
image(PNG, 0, 0);
fill(255);
textAlign(LEFT, CENTER);
text(texto1, textoX1, height - 100);
textoX1 -= 2;
if (textoX1 < -textWidth(texto1)) {
pantalla = 2;
}
}
//pantalla-2
else if (pantalla == 2) {
image(fondo2, 0, 0, width, height);
fill(255, 255, 0); // Amarillo
textAlign(LEFT, TOP);
text(texto2, 20, textoY2);
textoY2 -= 1;
if (textoY2 < -600) {
pantalla = 3;
}
}
//Pantalla-3
else if (pantalla == 3) {

image(fondo3, 0, 0, width, height);
fill(255, 255, 0);
if (!textoCentrado3) {
textAlign(LEFT, CENTER);
text(texto3, textoX3, height / 2);
textoX3 += 2;
if (textoX3 >= width / 2 - (int)(textWidth(texto3) / 2)) {
textoCentrado3 = true;
}
} else {
textAlign(CENTER, CENTER);
text(texto3, width / 2, height / 2);
contadorFrames++;
if (contadorFrames >= 250) {
Boton = true;
}
}

//botoncio
if (Boton) {
fill(0);
rect(width - 110, height - 40, 100, 30);
fill(255);
textAlign(CENTER, CENTER);
text("Reiniciar", width - 60, height - 25);
}
}
}
 // para que el mouse funque al precionar el botoncito
void mousePressed() {
if (Boton && mouseX > width - 110 && mouseX < width - 10 &&
mouseY > height - 40 && mouseY < height - 10) {
  //reinicio de las variables, para que se vea como si inicio nuevamente
pantalla = 1;
textoX1 = 640;
textoY2 = 480;
textoX3 = 0;
textoCentrado3 = false;
contadorFrames = 0;
Boton = false;
}
}
