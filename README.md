# Meth Tools

Probably has typos, expect jank.

Designed to work with https://methamphetamine.solutions/ but most things will work without it.\
*If you are using Meth and something breaks, try it without safe mode before reporting it.*

<details>
<summary>Things inside this repository</summary>
  
- Swag Tools
- Meth hitbox backtrack visualization
- Meth keybind indicators
- Meth hitbox esp
- Libbys hax
- China hats
- Meth custom antiaim
- Shitty circle strafer paste
- Meth patch lua thing
- Manual antiaim
- Entity aimbot
- Fancy shot records
- Eye tracers
- Swastika crosshair
- 3D Penetration Crosshair
</details>

// Аварийный маячок для Wokwi.com

// Определяем пины, к которым подключены светодиоды
const int ledPin1 = 8; // Пин для первого светодиода
const int ledPin2 = 7; // Пин для второго светодиода

// Определяем интервал мигания (в миллисекундах)
// 500 мс = полсекунды включен, полсекунды выключен
const int blinkInterval = 500;

void setup() {
  // Настраиваем пины светодиодов как выходы
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
}

void loop() {
  // Включаем ОБА светодиода
  digitalWrite(ledPin1, HIGH); // Подаем напряжение на пин 8
  digitalWrite(ledPin2, HIGH); // Подаем напряжение на пин 7

  // Ждем заданный интервал
  delay(blinkInterval);

  // Выключаем ОБА светодиода
  digitalWrite(ledPin1, LOW);  // Снимаем напряжение с пина 8
  digitalWrite(ledPin2, LOW);  // Снимаем напряжение с пина 7

  // Ждем заданный интервал
  delay(blinkInterval);

  // Цикл повторяется
}
