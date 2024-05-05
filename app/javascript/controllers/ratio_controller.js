import {Controller} from "@hotwired/stimulus"
import {useWindowResize} from 'stimulus-use'

export default class extends Controller {

    static targets = ["embed"]

    connect() {
        useWindowResize(this)
    }

    windowResize({width}) {
        this.embedTarget.width = width
        this.embedTarget.height = Math.floor(width / 1.78)
    }

}