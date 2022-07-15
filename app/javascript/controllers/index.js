// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import MobileNavigationController from "./mobile_navigation_controller.js"
import ConstellationController from "./constellation_controller"
import EmbedController from "./embed_controller"

application.register("mobilenavigation", MobileNavigationController)
application.register("constellation", ConstellationController)
application.register("embed", EmbedController)