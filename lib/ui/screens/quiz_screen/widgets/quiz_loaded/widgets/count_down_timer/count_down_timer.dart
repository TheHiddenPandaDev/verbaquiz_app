part of '../../../../quiz_screen.dart';

class CountDownTimer extends StatelessWidget {
  final bool hasCountDown;
  final CountDownController countDownController;
  final Function() onComplete;

  const CountDownTimer({
    super.key,
    required this.hasCountDown,
    required this.countDownController,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return hasCountDown
        ? CircularCountDownTimer(
            duration: 10,
            initialDuration: 1,
            controller: countDownController,
            width: 150,
            height: 150,
            ringColor: Colors.grey[300]!,
            ringGradient: null,
            fillColor: Colors.purpleAccent[100]!,
            fillGradient: null,
            backgroundColor: Colors.purple[500],
            backgroundGradient: null,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () => onComplete.call(),
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "Start";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          )
        : const SizedBox.shrink();
  }
}
