import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import '../../my_game.dart';

enum RobotState {
  idle,
  jump,
  fall,
  walk,
  duck,
}

class Robot extends BodyComponent {
  final _size = Vector2(1.80, 2.4);
  final _componentPosition = Vector2(0, -.325);
  RobotState state = RobotState.idle;

  late final SpriteComponent idleComponent;
  late final SpriteComponent jumpComponent;
  late final SpriteComponent fallComponent;
  late final SpriteComponent duckComponent;

  late final SpriteAnimationComponent walkComponent;

  late Component currentComponent;
  int accelerationX = 0;
  bool isDucking = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;

    final idle = await gameRef.loadSprite('robot/robot_idle.png');
    final jump = await gameRef.loadSprite('robot/robot_jump.png');
    final fall = await gameRef.loadSprite('robot/robot_fall.png');
    final duck = await gameRef.loadSprite('robot/robot_duck.png');

    final walk0 = await gameRef.loadSprite('robot/robot_walk0.png');
    final walk1 = await gameRef.loadSprite('robot/robot_walk1.png');
    final walk2 = await gameRef.loadSprite('robot/robot_walk2.png');
    final walk3 = await gameRef.loadSprite('robot/robot_walk3.png');
    final walk4 = await gameRef.loadSprite('robot/robot_walk4.png');
    final walk5 = await gameRef.loadSprite('robot/robot_walk5.png');
    final walk6 = await gameRef.loadSprite('robot/robot_walk6.png');
    final walk7 = await gameRef.loadSprite('robot/robot_walk7.png');

    idleComponent = SpriteComponent(
      sprite: idle,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );
    jumpComponent = SpriteComponent(
      sprite: jump,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );
    fallComponent = SpriteComponent(
      sprite: fall,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );
    duckComponent = SpriteComponent(
      sprite: duck,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
    );

    final walkAnimation = SpriteAnimation.spriteList(
      [
        walk0,
        walk1,
        walk2,
        walk3,
        walk4,
        walk5,
        walk6,
        walk7,
      ],
      stepTime: 0.05,
      loop: true,
    );

    walkComponent = SpriteAnimationComponent(
      animation: walkAnimation,
      size: _size,
      position: _componentPosition,
      anchor: Anchor.center,
      removeOnFinish: false,
    );

    currentComponent = idleComponent;
    add(idleComponent);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(worldSize.x / 2, worldSize.y - 3),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(_size.x / 2, .90);

    final fixtureDef = FixtureDef(shape)
      ..density = 15
      ..friction = 0
      ..restitution = 0;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final velocity = body.linearVelocity;
    if (velocity.y > 0.1) {
      state = RobotState.fall;
    } else if (velocity.y < 0.1 && state != RobotState.jump) {
      if (accelerationX != 0) {
        state = RobotState.walk;
      } else if (isDucking) {
        state = RobotState.duck;
      } else {
        state = RobotState.idle;
      }
    }

    velocity.x = accelerationX * 3;
    body.linearVelocity = velocity;

    if (state == RobotState.jump) {
      _setComponent(jumpComponent);
    } else if (state == RobotState.fall) {
      _setComponent(fallComponent);
    } else if (state == RobotState.idle) {
      _setComponent(idleComponent);
    } else if (state == RobotState.duck) {
      _setComponent(duckComponent);
    } else if (state == RobotState.walk) {
      _setComponent(walkComponent);
    }
  }

  void idle() {
    accelerationX = 0;
    isDucking = false;
  }

  void jump() {
    if (state == RobotState.jump) return;

    final velocity = body.linearVelocity;
    body.linearVelocity = Vector2(velocity.x, -10);
    state = RobotState.jump;
  }

  void duck() {
    isDucking = true;
  }

  void walkLeft() {
    accelerationX = -1;
  }

  void walkRight() {
    accelerationX = 1;
  }

  void _setComponent(PositionComponent component) {
    if (accelerationX < 0) {
      if (!component.isFlippedHorizontally) {
        component.flipHorizontally();
      }
    } else {
      if (component.isFlippedHorizontally) {
        component.flipHorizontally();
      }
    }

    if (component == currentComponent) return;

    remove(currentComponent);
    currentComponent = component;
    add(component);
  }
}
