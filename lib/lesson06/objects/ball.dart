import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../my_game.dart';
import 'object_state.dart';

class Ball extends BodyComponent with ContactCallbacks {
  ObjectState state = ObjectState.normal;

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ball) {
      hit();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (state == ObjectState.explode) {
      world.destroyBody(body);
      gameRef.remove(this);
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(worldSize.x / 2, 0),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = .25;
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .5
      ..restitution = .5;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(gameRef.images.fromCache('ball.png'));
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(.5, .5),
        anchor: Anchor.center,
      ),
    );
  }

  void hit() {
    if (state == ObjectState.normal) {
      state = ObjectState.explode;
    }
  }
}
