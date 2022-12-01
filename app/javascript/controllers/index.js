// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BookingSubscriptionController from "./booking_subscription_controller"
application.register("booking-subscription", BookingSubscriptionController)

import ButtonController from "./button_controller"
application.register("button", ButtonController)

import MapController from "./map_controller"
application.register("map", MapController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import RestaurantSubscriptionController from "./restaurant_subscription_controller"
application.register("restaurant-subscription", RestaurantSubscriptionController)

import TagsController from "./tags_controller"
application.register("tags", TagsController)

import TogglerController from "./toggler_controller"
application.register("toggler", TogglerController)
