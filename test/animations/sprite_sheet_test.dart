part of gdp_test;

void spriteSheetTest() {
  group('SpriteSheet: ', () {
    SpriteSheet ss = new SpriteSheet("test.png", 10, 15, 80, 80);
    test("Construction spriteX", () {expect(ss.spritex, equals(10));});
    test("Construction spriteY", () {expect(ss.spritey, equals(15));});
  });
}