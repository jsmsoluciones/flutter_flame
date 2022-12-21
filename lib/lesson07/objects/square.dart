import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../my_game.dart';

class Square extends BodyComponent {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(gameRef.images.fromCache('box.png'));
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(.5, .5),
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(worldSize.x / 2, 0),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(.25, .25);
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = .5;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
