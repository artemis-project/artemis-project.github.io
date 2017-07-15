---
layout: post
title: Wayland, Qt, and Swift vs. D
author: Wesley Hershberger
categories: design insight
permalink: /insights/design/wayland-qt-and-swift-vs-d/
excerpt_separator: <!--more-->
---
Hello Artemis Community! I'm Wesley (some of you have probably met me in Telegram), and Marquis asked me to write this post about the stuff I've been posting and looking into recently.

<!--Hey folks!-->

## Wayland
Every graphical desktop environment for Linux today has windows. They are a staple of every desktop experience. As it says on the main page of this site:

> "The Artemis Project aims to bring the best environments to continue the venerable Unity 7 desktop in the modern Linux space."

Unity has windows, just like everyone else. Contrary to what you may have heard or thought, Unity is not actually controlling those windows. Yes, it defines how they look, but it doesn't actually do any of the drawing.

X does. X is a massive program that's (current) job is to communicate between the Kernel, the compositor (the program that does the actual drawing), and the clients (each program that you run in a window).

It didn't always used to be like that. When X11 (the current version, the one that came out in **1987**!) was released, X did all the drawing. But back then, people didn't want to do a lot with their windows. They'd put some text and a button in them. But as X aged, people started to want to do more things. Play video. Do complex graphics. Fancy animations. So the problems that X was designed to solve went away, and were replaced with new ones. And instead of replacing X, X was modded and wrapped up in lots of layers to get the new functionality. Then it was stripped down and a lot of core functionality was removed, and outsourced to other programs. The long and short of it is, X no longer does much. It's just a middleman (if you want a more complete understanding of X's deficiencies, Daniel Stone, an ex-X dev and core Wayland dev gives a good talk explaining some of that stuff [here](https://www.youtube.com/watch?v=GWQh_DmDLKQ)).

Enter Wayland. Wayland is a protocol (not a program, just a way for programs to talk to each other) that is deigned to handle modern needs for window management, as well as drastically simplifying and speeding up window management and overall making the desktop experience better. Some of you will have heard that Fedora 25 under Gnome is Wayland by default (released in November of 2016). As for Artemis, our goals are, again,

> "...to continue the venerable Unity 7 desktop in the modern Linux space."

Using Wayland makes sense. Using X doesn't. This is a learning process as to how everything needed to create a desktop shell works. Wayland provides us a clear base for that.

### Compositors
Wayland is a protocol, not a program. It specifies how windows and programs are supposed to interact. A program called the Wayland Compositor talks to the Kernel and the clients (the programs you're running in windows) to draw things to your screen. However, Wayland in of itself doesn't do anything. It's simply a bunch of rules governing how all those parts talk to each other. To actually create a desktop with Wayland, you need a compositor. There are a few.
* For starters, the guys who created Wayland have a refernece implementation of the protocol, which they have named Weston. Weston is not a production-grade tool. It is designed as a demo, and to be used as such.
* Gnome's compositor, Mutter, was ported from X for Wayland, and can run under either system.
* Kwin is the compositor that is in development by the KDE guys.
* Mir was the compositor used by Unity 8, and is still currently in use by Yunit. There has also been talk of using Mir for the MATE desktop environment.
* And there is always the option to write our own, either from scratch or using some external library.

## Gui Toolkit
As it stands, there are two common high-level toolkits for creating gui applications. Most of you will have heard of them. They are GTK+ and Qt. GTK+ is the toolkit the Gnome project develops and is used in the Gnome shell, as well as many older desktops. Qt is independently developed by the Qt company, and is open source, although it is also availabe under a commercial license.

Because GTK+ is written in C, it is very easy for many languages to interface to it. However, because it is developed by the Gnome project, it leans toward their goals for their desktop shell, more so now than in the past.

On the other hand, Qt is independently developed in C++. Qt is more feature-rich than GTK+, and behaves more like a framework. I'll talk more about languages further down, but none of us who would actually be designing and building Artemis want to be writing in C++, even less than we'd want to write in C. C++ is also harder to interface to from other languages.

A final decision has not been made this early in the planning process, but we are currently leaning towards Qt, especially given some language considerations (see below).

## Languages
Specifically, D vs. Swift is the argument we continue to have in the IM system. Let's take a deeper look at both of these. I'll try to hold my personal opinion for this.

### Both
Swift and D are similar. Like C/C++, they are compiled languages, so they tend to run faster than something like Python. They are also both open-source languages, so there are no legal issues we would run into using either language. They are both designed with systems programming in mind, and are both multi-paradigm (allowing for object-oriented and functional programming, among others). They can both dynamically and statically link to existing C libraries. They are both statically typed (meaning that the compiler knows the type of each variable at compile time).

### [Swift](https://swift.org)
Swift was designed by Apple Inc.(No, this does not immediately make it trash) and was open-sourced within the last five years. It was designed as a replacement for Objective-C, to allow for easier development of applications. Currently the swift compiler only officially supports Ubuntu and Mac OSX, although the source can be downloaded and compiled on any Linux-based OS, provided that you have the correct libraries installed. Swift is designed with memory safety in mind, and therefore does not allow the programmer to use pointers or do unsafe memory operations. It is garbage collected. Swift is statically typed, but it uses type inference. It's syntax is lighter than C's (semicolons are not necessary at the end of every line, although they can be used), and removes things like the increment and decrement operators (++ and --, it uses += and -= instead), as well as removing traditional for-loops.

### [D](https://dlang.org)
D was designed by two very experienced C++ and was designed to be what C++ should have been. It has all the power of low level C (allowing programmers to use pointers and other manual memory management), but also has many of the conveniences of higher-level scripting languages (dynamic arrays, built-in associative arrays or hashmaps, a foreach loop, and is garbage collected by default(although the gc can be turned off)). D's syntax is vary similar to C's. A piece of C code without any preprocessor directives will compile on a D compiler, and behave the same way it did when being compiled with a C compiler. Compiled D code is completely compatible with compiled C and C++ code.

### Toolkit Bindings
Both of these languages have a well-supported and actively developed binding to GTK. Neither have a solid binding to Qt. However, Andreas Schulz ([Longhanks](https://github.com/Longhanks) on github) is in the early stages of creating a C wrapper around Qt. His end goal is to create a swift binding for this C library (it already works!). With very little effort, this C binding could also be used as the base for a D binding. If anyone has any experience, help would be appreciated on the binding front.

Thanks for reading folks! This is a fairly accurate summary of what is on my mind as I apply myself to the problem of developing Artemis, and what we're trying to do right now. We appreciate the continued support.
