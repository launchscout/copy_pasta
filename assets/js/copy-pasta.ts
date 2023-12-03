import { LitElement, html } from "lit";
import { customElement, property, state } from "lit/decorators.js";
import { liveState, liveStateConfig } from 'phx-live-state';

@customElement('copy-pasta')
@liveState({
  topic: 'copy_pasta:all'
})
export class CopyPastaElement extends LitElement {

  @liveStateConfig('url')
  @property()
  url: string = '';

  render() {
    return html`<h1>Hello there!</h1>`
  }
}