import 'package:flutter/material.dart';

class HelpData {
  final String title;
  final String content;
  final Image image;
  HelpData({
    required this.title,
    required this.content,
    required this.image,
  });
}

final List<HelpData> helpData = [
  HelpData(
    image: Image.asset('assets/images/help/fun.jpg'),
    title: 'Make it fun',
    content: 'The child has less chance of being distracted when performing a complex job in which he is in high concentration, so it is good to encourage the child to continue if he enjoys performing the challenges with high concentration.',
  ),
  HelpData(
    title: 'Give them praise and encouragement',
    image: Image.asset('assets/images/help/en.webp'),
    content:
        'It is important to encourage positive behavior with praise, as well as to avoid bad behaviour.',
  ),
  HelpData(
    title: 'Create a specific system',
    image: Image.asset('assets/images/help/orderr.jpg'),
    content:
        'Establishing a specific daily routine may reduce sudden distractions. Knowing the child about his tasks in advance helps him calm down and teaches him to take responsibility.',
  ),
  HelpData(
    title: 'Encourage them to exercise',
    image: Image.asset('assets/images/help/sports.jpg'),
    content: 'Getting rid of excess energy through exercise helps: Avoid depression and anxiety. Enhance focus and attention. Improve sleep patterns. Brain alertness and alertness. Parents can encourage their children to do energizing exercises, such as ball games, jump rope, bike rides, or enroll them in a sports club. It is good for parents to set an example for their children in this regard. Playing outside or taking a walk with the family helps the child release excess energy and adopt healthy habits for the future.',
  ),
  HelpData(
    title: 'Maintain healthy sleep habits',
    image: Image.asset('assets/images/help/sleep.webp'),
    content:
        'Studies have shown that poor sleep habits have a negative impact on ADHD symptoms. Healthy sleep helps to raise activity levels for the next day, reduce anxiety and improve mood. Therefore, it is important for parents to make sure to establish regular sleeping hours in their children\'s daily regimen.',
  ),
  HelpData(
    title: 'Divide the errands',
    image: Image.asset('assets/images/help/task.jpg'),
    content:
        'Some tasks may seem overly complex and alienating to the child, so divide the tasks into as easy goals as possible, to make it simple and control feelings associated with success and failure. If you ask your child to tidy up her room, break it down into smaller tasks such as making the bed, rearranging the toys or folding the clothes.',
  ),
  HelpData(
    title: 'Think out loud',
    image: Image.asset('assets/images/help/think.jpg'),
    content:
        'Children with ADHD often lack the ability to control their impulses, they may say or do something directly without thinking, so urging them to slow down and share their thoughts out loud enables parents to notice their children\'s thinking patterns, and enables the child to take time to evaluate his ideas and choose to implement them or not to implement it.',
  ),
  HelpData(
    title: 'Reduce distractions',
    image: Image.asset('assets/images/help/clean.jpg'),
    content:
        'It is preferable to arrange and simplify the environment around the child if it is easy to distract him and steal his attention. It is important to get them to do their tasks away from the temptations of television or games. Toys should also be put away when performing tasks in their room.',
  ),
  HelpData(
    title: 'Explanation instead of command',
    image: Image.asset('assets/images/help/exp.jpg'),
    content:
        'Parents or caregivers can give understandable rationales for their request. Keep your explanation simple and expect to be asked for more detail. Explaining the reasons for the assignments relieves the child\'s anxiety and confusion. Clear and positive language must be adopted when explaining. Explaining the reasons enhances the child\'s status and gives him respect, and self-respect is essential for a child with this disorder, as he feels different from others.',
  ),
  HelpData(
    title: 'Know the waiting time',
    image: Image.asset('assets/images/help/waiting.webp'),
    content:
        'The idea of ​​waiting time is similar to thinking out loud. If the child waits a few seconds before speaking or acting, he will have time to judge his behavior. This will take a lot of training, but it will pay off in the end, and will give them good social experience with their surroundings.',
  ),
  HelpData(
    title: 'Avoid pressure',
    image: Image.asset('assets/images/help/avoid_Pressure.png'),
    content:
        'Excessive worrying not only harms parents overall health, but also reduces their support for their children, so seek support when the pressure of work and commitments mounts up and you start to feel overwhelmed. You may find support in your friends, family, or surrounding groups. It may help to eliminate certain tasks from your weekly schedule, which can reduce stress.',
  ),
  HelpData(
    title: 'Avoid using negative language',
    image: Image.asset('assets/images/help/not_yaling.jpg'),
    content:
        'Constructive opinions and criticism build the child\'s self-confidence. Children with ADHD may feel unloved or always in the wrong, as negative language hurts their feelings and makes indiscretions worse. It\'s impossible to stay positive all the time, so parents need to find a way to articulate their concerns and issues, with the help of a friend, partner, or therapist. There are many online groups for parents of ADHD, where they share the challenges they face.',
  ),
  HelpData(
    title: 'Don\'t allow disorder to take over',
    image: Image.asset('assets/images/help/consequ.jpg'),
    content:
        'Forgive your slip-ups, but know that ADHD is no excuse for bad behavior. Boundaries must be set for children and parents, and it is necessary for the child to learn the consequences of his bad behavior.',
  ),
  HelpData(
    title: 'Pick your battles',
    image: Image.asset('assets/images/help/choose.jpg'),
    content:
        'Living with a child with hyperactivity and impulsive behavior is an ongoing challenge. If parents look closely at every problem and behavior, everyone will be stressed and upset all the time. Ignoring small mistakes relieves stress in the long run and helps parents focus and take control of the big problems.',
  ),
  HelpData(
    title: 'Do not treat others aggressively',
    image: Image.asset('assets/images/help/aggressive.jpg'),
    content:
        'Guardianship and protective feelings are normal for parents, but when their child has ADHD, caregivers don\'t seem to care or understand enough. Good communication is enough to resolve this conflict, and it is helpful to talk about the disturbance with the people your child communicates with.',
  ),
  HelpData(
    title: 'Continue to work on changing his behavior',
    image: Image.asset('assets/images/help/keep_changing.webp'),
    content:
        'You may feel that you have exhausted all attempts to modify your child\'s behavior. Don\'t give up, be patient and try to change your strategy, and remember that it takes time.',
  ),
  HelpData(
    title: 'Get expert support',
    image: Image.asset('assets/images/help/doc.jpg'),
    content:
        'A specialist psychotherapist deals with parents concerns as well as the child\'s behaviour. You may find support in local or international groups or parents who have been through similar circumstances.',
  ),
  HelpData(
    title: 'Get a break',
    image: Image.asset('assets/images/help/rest.jpg'),
    content:
        'It can be stressful to focus on your child all day, let a babysitter take over for a while or switch tasks with your partner. The more energy you have, the better you will handle stress.',
  ),
  HelpData(
    title: 'keep calm',
    image: Image.asset('assets/images/help/calm.jpg'),
    content: 'To be able to focus on solutions and communicate well, keep your cool by:'
        '\n 1- Meditation.'
        '\n 2- practicing yoga.'
        '\n 3- Stick to the routine and stop worrying about the future.'
        '\n 4- Nature walk.'
        '\n 5- Reducing caffeine and alcohol.',
  ),
  HelpData(
    title: 'Remember that all children make mistakes',
    image: Image.asset('assets/images/help/all_kids.webp'),
    content:
        'Not every problem you encounter is caused by this disorder, as all children may misbehave. Try to distinguish between different behaviors and deal with them.',
  ),
  HelpData(
    title: 'Don\'t be hard on yourself',
    image: Image.asset('assets/images/help/hard.jpg'),
    content:
        'You may think that other parents have made better progress than you, but if you talk to them you will find that they all think the same. Stop blaming yourself and be proud of what you have achieved so far.'
        '\n 1- How do I talk to my kids about ADHD?'
        '\n 2- The disease is diagnosed at an average age of seven years. When talking to your children about ADHD, be sure to use simple, appropriate language. Start your conversation with them by stating that:'
        '\n 3- ADHD is not a defect:'
        '\n 4- It does not make them different from the rest, and its negative impact on the life of the child can be reduced with appropriate support.'
        '\n 5- The disorder does not affect their intelligence:'
        '\n 6- Remind them that some of the greatest thinkers have also been diagnosed with it, including Albert Einstein and Thomas Edison.'
        '\n 7- Affected individuals can succeed and excel in their lives:'
        '\n 8- Give them a live example of that, such as a close neighbor or a beloved celebrity.'
        '\n 9- They are not alone'
        '\n 10- One in ten children is affected by this disorder in the United States, and the proportion may rise to one in five, or approximately 20 percent. The affected child may feel lonely, so it is necessary to create an environment that helps him to integrate as groups of similar children, which helps him to gain social skills and overcome loneliness.',
  ),
];
