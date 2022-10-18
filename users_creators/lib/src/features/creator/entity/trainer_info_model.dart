import 'package:flutter/material.dart';

class TrainerInfo {
  String title;
  String? subTitle;
  String text;
  String? instagram;
  String? tikTok;
  String? youtube;

  TrainerInfo(
      {required this.title,
      required this.subTitle,
      required this.text,
      required this.instagram,
      required this.tikTok,
      required this.youtube});
}

List<TrainerInfo> trainerInfo = [
  TrainerInfo(
    title: 'About',
    subTitle: 'A BRIEF INTRO',
    text:
        '''I\'m so happy to have you here! Before you dive into my workouts, nutrition, and mindset guidance, here is a little about me. 

When I first started to workout, I STRUGGLED and had a hard time going to the gym like most people. I was insecure about what I was wearing, who was looking at me, my posture, heck even the routine had going on.... it was just a nightmare. I felt like I was walking in there a with a blindfold and it was because had no guidance, I was showing up without a plan. No one drives to a destination without directions so it should be no different when starting your fitness journey. My boyfriend, who is now my husband, started to bring me to the gym with him so I felt more comfortable. He even bought me 2 cute Gymshark outfits so that I would feel more confident while working out. I followed along my favorite fitness influencers. I did lots and lots of my own research about glute growth and dare say it was working! started carrying myself a little bit higher as the days progressed, feeling more and more COMFORTABLE lifting weights at the gym. I was CONSISTENT by balancing gym and home routines. I started seeing a DIFFERENCE in the shape of my BOOTY, my BODY and the way FELT! So I want to share and create the same success with as many women as I can!

Because I\'m passionate about fitness and living a healthy lifestyle, I got my certification as a personal trainer and nutritionist. Nutrition is 80% of it all (check out my nutrition guide) but to sum it all up, clean eating has changed the way my body feels INTERNALLY.

FITNESS EQUALS HEALTH.''',
    instagram: null,
    tikTok: null,
    youtube: null,
  ),
  TrainerInfo(
    instagram: null,
    tikTok: null,
    youtube: null,
    title: 'Specification',
    subTitle: 'WHAT I WANT US TO  ACCOMPLISH',
    text:
        'I want you to be proud of what you see in the mirror! I want to bring you to a place where you are completely happy with your body and the way you feel. We will work together to push you through your limits to get there! The BEST SHAPE by Maria programs are all about building amazing habits for how you workout and eat. I\'m here to help you achieve healthy lifestyle, help you reach your goals, and become a better version of yourself!',
  ),
  TrainerInfo(
    instagram: null,
    tikTok: null,
    youtube: null,
    title: 'Experience',
    subTitle: 'MY CERTIFICATES, ACCOMPLISHMENTS, ETC.',
    text:
        'I\'m a certified personal trainer and fitness nutrition specialist. I have achieved to reach many women of all ages and inspired them to transform their lives through fitness and nourishment.',
  ),
  TrainerInfo(
    instagram: null,
    tikTok: null,
    youtube: null,
    title: 'Requirements',
    subTitle: 'WHAT YOU NEED TO TRAIN WITH ME',
    text:
        'I want you to be proud of what you see in the mirror! I want to bring you to a place where you are completely happy with your body and the way you feel. We will work together to push you through your limits to get there! The BEST SHAPE by Maria programs are all about building amazing habits for how you workout and eat. I\'m here to help you achieve healthy lifestyle, help you reach your goals, and become a better version of yourself!',
  ),
  TrainerInfo(
      instagram: 'assets/icons/creator/instagram.svg',
    tikTok: 'assets/icons/creator/tik_tok_black.svg',
    youtube: 'assets/icons/creator/youtube.svg',
  
    title: 'Social Media',
    subTitle: null,
    text: 'Follow me on Instagram and remember to tag me in your pictures!',
  ),
  TrainerInfo(
    instagram: null,
    tikTok: null,
    youtube: null,
    title: 'Certification',
    subTitle: null,
    text: 'These are my certificates of training in the fitness industry',
  )
];
