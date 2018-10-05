#include <Arduino.h>

#include <LiquidCrystal_I2C.h>

#define LCD_ADDRESS     0x27
#define LCD_COLUMNS     20
#define LCD_ROWS        4

LiquidCrystal_I2C lcd(LCD_ADDRESS, LCD_COLUMNS, LCD_ROWS);


void setup() {
    Serial.begin(9600);
    lcd.begin(LCD_COLUMNS, LCD_ROWS);
    lcd.clear();
}

void loop() {
}