//Rodrigo Corbani 
PImage original;
color puntoColor, lineaColor, fondoColor;
boolean animarPuntos = false;
boolean teclaAnterior = false;

void setup() {
  size(800, 400);
  original = loadImage("F_7.jpeg");
  puntoColor = color(255);
  lineaColor = color(128);
  fondoColor = color(0);
}

void draw() {
  background(255);
  image(original, 0, 0, 400, 400);

  // Entrada de mouse
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fondoColor = color(random(255), random(255), random(255));
    } else if (mouseButton == RIGHT) {
      puntoColor = color(random(128, 255), random(128, 255), random(128, 255));
    }
  }

  // Toggle de animación con tecla "v"
  if (keyPressed && key == 'v' && !teclaAnterior) {
    animarPuntos = !animarPuntos;
    teclaAnterior = true;
  } else if (!keyPressed || key != 'v') {
    teclaAnterior = false;
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
        tam = calcularTamanioAnimado(x, y);
      }

      fill(puntoColor);
      ellipse(x, y, tam, tam);
    }
  }
}

//Función que retorna un valor
float calcularTamanioAnimado(float x, float y) {
  float d = dist(x, y, 600, 200);  // distancia al centro
  float angulo = d * 0.05 + frameCount * 0.05;
  return map(sin(angulo), -1, 1, 5, 12);
}
