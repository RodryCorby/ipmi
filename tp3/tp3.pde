//Rodrigo Corbani 
PImage Fotubi;
color puntoColor, lineaColor, fondoColor;
boolean animarPuntos = false;
boolean Anterior = false;

void setup() {
  size(800, 400);
  Fotubi = loadImage("F_7.jpeg");
  puntoColor = color(255);
  lineaColor = color(128);
  fondoColor = color(0);
}

void draw() {
  background(255);
  image(Fotubi, 0, 0, 400, 400);

  //Cambiar colores con el mouse xd
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fondoColor = color(random(255), random(255), random(255));
    } else if (mouseButton == RIGHT) {
      puntoColor = color(random(128, 255), random(128, 255), random(128, 255));
    }
  }

  // activar y desactivar la animación de los puntos
  if (keyPressed && key == 'v' && !Anterior) {
    animarPuntos = !animarPuntos;
    Anterior = true;
  } else if (!keyPressed || key != 'v') {
    Anterior = false;
  }

  // Teclas para cambiar colores y reiniciar
  if (keyPressed) {
    if (key == ' ') {
      lineaColor = color(random(128, 255), random(128, 255), random(128, 255));
    } else if (key == 'r') {
      puntoColor = color(255);
      lineaColor = color(128);
      fondoColor = color(0);
      animarPuntos = false;
    }
  }

  // Fondo lado derecho
  fill(fondoColor);
  noStroke();
  rect(400, 0, 400, 400);

  int cols = 8;
  int rows = 8;
  float spacing = 50;

  for (int i = 0; i <= cols; i++) {
    for (int j = 0; j <= rows; j++) {
      float x = 400 + i * spacing;
      float y = j * spacing;

      // Líneas
      if (j == 0) {
        stroke(lineaColor);
        strokeWeight(10);
        line(x, 0, x, 400);
      }
      if (i == 0) {
        stroke(lineaColor);
        strokeWeight(10);
        line(400, y, 800, y);
      }

      // Puntos
      noStroke();
      float tam = 10;

      if (animarPuntos) {
        tam = CalcularTamañoDePuntos(x, y);
      }

      fill(puntoColor);
      ellipse(x, y, tam, tam);
    }
  }
}

//Función que retorna un valor
float CalcularTamañoDePuntos(float x, float y) {
  float d = dist(x, y, 600, 200);  // distancia al centro
  float angulo = d * 0.05 + frameCount * 0.05;
  return map(sin(angulo), -1, 1, 5, 12);
}
//Funcion que no retorna valor
  void dibujarLineaSinValorKjjjj(float x1, float y1, float x2, float y2) {
  strokeWeight(2);
  stroke(255, 100, 100);
  line(x1, y1, x2, y2);
}
