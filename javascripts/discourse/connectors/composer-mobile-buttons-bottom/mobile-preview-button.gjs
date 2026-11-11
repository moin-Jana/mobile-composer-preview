import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { service } from "@ember/service";
import DButton from "discourse/ui-kit/d-button";
import dIcon from "discourse/ui-kit/helpers/d-icon";
import { i18n } from "discourse-i18n";

export default class MobilePreviewButton extends Component {
  @service composer;
  @service siteSettings;

  <template>
    {{#if this.composer.allowPreview}}
      {{#if this.siteSettings.enable_composer_redesign}}
        {{#if this.composer.isPreviewVisible}}
          <DButton
            class="return-to-edit btn-transparent"
            @action={{this.composer.togglePreview}}
            @translatedLabel={{i18n (themePrefix "edit")}}
          />
        {{else}}
          <DButton
            class="show-preview btn-transparent"
            @action={{this.composer.togglePreview}}
            @translatedLabel={{i18n (themePrefix "preview")}}
          />
        {{/if}}
      {{else}}
        {{#if this.composer.isPreviewVisible}}
          <DButton
            class="hide-preview btn-default"
            @action={{this.composer.togglePreview}}
            @icon="pencil"
            @translatedAriaLabel={{i18n (themePrefix "hide_preview")}}
            @translatedTitle={{i18n (themePrefix "hide_preview")}}
          />
        {{else}}
          <a
            aria-label={{i18n (themePrefix "show_preview")}}
            class="btn btn-default no-text mobile-preview"
            href
            title={{i18n (themePrefix "show_preview")}}
            {{on "click" this.composer.togglePreview}}
          >
            {{dIcon "desktop"}}
          </a>
        {{/if}}
      {{/if}}
    {{/if}}
  </template>
}
