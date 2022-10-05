import { Controller } from "@hotwired/stimulus"
import { Application } from '@hotwired/stimulus'
 import Dropdown from 'stimulus-dropdown'

 const application = Application.start()
 application.register('dropdown', Dropdown)

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
  }
}
