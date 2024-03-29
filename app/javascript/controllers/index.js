// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DashboardController from "./dashboard_controller"
application.register("dashboard", DashboardController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PollController from "./poll_controller"
application.register("poll", PollController)

import TextareaAutogrow from 'stimulus-textarea-autogrow'
application.register('textarea-autogrow', TextareaAutogrow)

import UserController from './user_controller';
application.register('user', UserController);

import HomeController from "./home_controller"
application.register("home", HomeController);

import LiveChartController from './live_chart_controller';
application.register('live-chart', LiveChartController);