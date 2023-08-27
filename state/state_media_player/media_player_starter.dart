abstract class PlayerState {
  void play(Player player);
  void stop(Player player);
  void pause(Player player);
  String getCurrentState();
}

class StoppedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(
      PlayingState(),
    );
    print('Now playing...');
  }

  @override
  void stop(Player player) {
    print('Media is already stopped');
  }

  @override
  void pause(Player player) {
    print('Media cannot be paused while stopped');
  }

  @override
  String getCurrentState() {
    return 'Media is currently stopped';
  }
}

class PlayingState implements PlayerState {
  @override
  void play(Player player) {
    print('Media is already playing');
  }

  @override
  void stop(Player player) {
    player.setState(
      StoppedState(),
    );
    print('Media has been stopped');
  }

  @override
  void pause(Player player) {
    player.setState(
      PausedState(),
    );
    print('Media has been paused');
  }

  @override
  String getCurrentState() {
    return 'Media is playing';
  }
}

class PausedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(
      PlayingState(),
    );
  }

  @override
  void stop(Player player) {
    player.setState(
      StoppedState(),
    );
  }

  @override
  void pause(Player player) {
    print('Media is already paused');
  }

  @override
  String getCurrentState() {
    return 'Media is paused';
  }
}

// Player class using State Design Pattern
class Player {
  PlayerState _state = StoppedState();

  Player() {
    _state = StoppedState();
  }

  void setState(PlayerState state) {
    _state = state;
  }

  void play() {
    _state.play(this);
  }

  void stop() {
    _state.stop(this);
  }

  void pause() {
    _state.pause(this);
  }

  String getCurrentState() {
    return _state.getCurrentState();
  }
}

void main() {
  Player player = Player();

  player.play();
  print(player.getCurrentState());

  player.pause();
  print(player.getCurrentState());

  player.pause();
  print(player.getCurrentState());

  player.play();
  print(player.getCurrentState());

  player.pause();
  print(player.getCurrentState());

  player.stop();
  print(player.getCurrentState());

  player.play();
  print(player.getCurrentState());
}
