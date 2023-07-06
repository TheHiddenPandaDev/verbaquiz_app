part of '../main_screen.dart';

class QuestionsList extends StatelessWidget {
  final List<Question> questions;

  const QuestionsList({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottom = 30;
    double top = 30;

    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        if (index == 0) top = 0;

        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              QuestionDetailsScreen.routeName,
              arguments: QuestionDetailParams(
                question: questions[index],
              ),
            );
          },
          child: Container(
            alignment: Alignment.topLeft,
            height: 150,
            margin: EdgeInsets.only(top: top, right: 16, left: 16, bottom: bottom),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffB9B9B9), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xFFB2DF28),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3.5),
                      Text(
                        questions[index].text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
