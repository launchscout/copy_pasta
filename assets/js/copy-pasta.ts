import { LitElement, html } from "lit";
import { customElement, property, state } from "lit/decorators.js";
import { liveState, liveStateConfig } from 'phx-live-state';

@customElement('copy-pasta')
@liveState({
  topic: 'copy_pasta:all',
  events: {
    send: ['serve-dapasta'],
    receive: ['eat-dapasta']
  }
})
export class CopyPastaElement extends LitElement {

  @liveStateConfig('url')
  @property()
  url: string = '';

  constructor() {
    super();
    this.addEventListener('eat-dapasta', ({detail: {pasta}}) => {
      console.debug('Eating pasta', pasta);
      navigator.clipboard.writeText(pasta);
    });
  }

  render() {
    return html`<button @click=${this.serveDaPasta}>Serve it up, nice and hot. Maybe things aren't as bad as you thought.</button>`
  }

  async serveDaPasta() {
    const pasta = await navigator.clipboard.readText();
    this.dispatchEvent(new CustomEvent('serve-dapasta', { detail: {pasta } }));
  }
}

declare global {
  interface HTMLElementEventMap {
    'eat-dapasta': CustomEvent<{ pasta: string }>;
  }
}