void main(){
  print("Hello World");
}
void draw(num _) {
  final num time = new DateTime.now().millisecondsSinceEpoch;
  if (renderTime != null)
    showFps(_, 1000 / (time - renderTime));
  renderTime = time;

  double elapsed = 0.0;
  if (lastTimestamp != 0) {
    elapsed = (time - lastTimestamp) / 1000.0;
  }

  lastTimestamp = time;
  if (currentState != null) {
    var nextState = currentState._update(elapsed);
    currentState._render();
    if (currentState != nextState) {
      currentState = nextState;
      currentState._initialize();
    }
  }

  requestRedraw();
}

void requestRedraw() {
  window.requestAnimationFrame(draw);
}
