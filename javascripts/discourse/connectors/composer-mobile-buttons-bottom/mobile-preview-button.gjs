import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { service } from "@ember/service";
import { and, not } from "discourse/truth-helpers";
import DButton from "discourse/ui-kit/d-button";
import dIcon from "discourse/ui-kit/helpers/d-icon";
import { i18n } from "discourse-i18n";

export default class MobilePreviewButton extends Component {
  @service composer;

  <template>
    {{#if
      (and this.composer.allowPreview (not this.composer.isPreviewVisible))
    }}
      <a
        href
        class="btn btn-default no-text mobile-preview"
        title={{i18n (themePrefix "show_preview")}}
        {{on "click" this.composer.togglePreview}}
        aria-label={{i18n (themePrefix "show_preview")}}
      >
        {{dIcon "desktop"}}
      </a>
    {{/if}}

    {{#if this.composer.isPreviewVisible}}
      <DButton
        @action={{this.composer.togglePreview}}
        @translatedTitle={{i18n (themePrefix "hide_preview")}}
        @translatedAriaLabel={{i18n (themePrefix "hide_preview")}}
        @icon="pencil"
        class="hide-preview btn-default"
      />
    {{/if}}
  </template>
}
