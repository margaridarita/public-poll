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

import ScrollController from "./scroll_controller"
application.register("scroll", ScrollController)

import UserController from "./user_controller"
application.register("user", UserController)