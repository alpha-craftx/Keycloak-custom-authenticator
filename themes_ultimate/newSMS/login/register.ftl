<#import "template.ftl" as layout>
  <@layout.registrationLayout; section>
    <#if section="header">
      <span>Sign Up </span>
      <#elseif section="form">
        <style>
        .input-otp {
          width: 50%;
          float: left;
          margin-bottom: 18px;
        }

        .button-otp {
          float: right;
          padding-top: 9px;
        }
        </style>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="hidden" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.mobile_number!'')}" />
          <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
            <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}
                  <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
              <i class="material-icons mdc-text-field__icon" role="button">person</i>
              <input tabindex="0" required id="firstName" class="mdc-text-field__input ${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" type="text" autofocus autocomplete="off">
              <div class="mdc-line-ripple"></div>
              <label for="firstName" class="mdc-floating-label ${properties.kcLabelClass!}">
                ${msg("firstName")}
              </label>
            </div>
          </div>
          <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
            <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}
                  <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
              <i class="material-icons mdc-text-field__icon" role="button">person</i>
              <input tabindex="0" required id="lastName" class="mdc-text-field__input ${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" type="text" autofocus autocomplete="off">
              <div class="mdc-line-ripple"></div>
              <label for="lastName" class="mdc-floating-label ${properties.kcLabelClass!}">
                ${msg("lastName")}
              </label>
            </div>
          </div>
          <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
            <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
              <i class="material-icons mdc-text-field__icon" role="button">email</i>
              <input tabindex="0" required id="email" class="mdc-text-field__input ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" type="text" autofocus autocomplete="off">
              <div class="mdc-line-ripple"></div>
              <label for="email" class="mdc-floating-label ${properties.kcLabelClass!}">
                ${msg("email")}
              </label>
            </div>
          </div>
          <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('user.attributes.mobile_number',properties.kcFormGroupErrorClass!)}">
            <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}
<#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
              <i class="material-icons mdc-text-field__icon" role="button">phone</i>
              <input tabindex="0" required id="user.attributes.mobile_number" class="mdc-text-field__input ${properties.kcInputClass!}" name="user.attributes.mobile_number" value="${(register.formData.mobile_number!'')}" type="text" autofocus autocomplete="off">
              <div class="mdc-line-ripple"></div>
              <label for="user.attributes.mobile_number" class="mdc-floating-label ${properties.kcLabelClass!}">
                Mobile Phone
              </label>
            </div>
          </div>
          <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('user.attributes.otp',properties.kcFormGroupErrorClass!)}">
            <div class="input-otp mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}
<#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
              <i class="material-icons mdc-text-field__icon" role="button">code</i>
              <input tabindex="0" required id="user.attributes.otp" class="mdc-text-field__input ${properties.kcInputClass!}" name="user.attributes.otp" value="${(register.formData.otp!'')}" type="text" autofocus autocomplete="off">
              <div class="mdc-line-ripple"></div>
              <label for="user.attributes.otp" class="mdc-floating-label ${properties.kcLabelClass!}">
                OTP
              </label>
            </div>
            <div class="button-otp mdc-card__action-buttons">
              <button tabindex="0" name="login" id="kc-otp" type="button" class="mdc-button mdc-button--raised mdc-card__action" onclick="otp()">
                Request OTP
              </button>
            </div>
          </div>
          <#if passwordRequired??>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
              <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" role="button">lock</i>
                <input tabindex="0" required id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off">
                <div class="mdc-line-ripple"></div>
                <label for="password" class="mdc-floating-label ${properties.kcLabelClass!}">
                  ${msg("password")}
                </label>
              </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
              <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" role="button">lock</i>
                <input tabindex="0" required id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm" type="password" autocomplete="off">
                <div class="mdc-line-ripple"></div>
                <label for="password-confirm" class="mdc-floating-label ${properties.kcLabelClass!}">
                  ${msg("passwordConfirm")}
                </label>
              </div>
            </div>
          </#if>
          <#if recaptchaRequired??>
            <div class="form-group">
              <div class="${properties.kcInputWrapperClass!}">
                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
              </div>
            </div>
          </#if>
          <div class="mdc-card__actions">
            <a href="${url.loginUrl}" class="mdc-button mdc-card__action mdc-card__action--button">
              <i class="material-icons mdc-button__icon">arrow_back</i>
              ${kcSanitize(msg("backToLogin"))?no_esc}
            </a>
            <div class="mdc-card__action-icons">
              <div class="mdc-card__action-buttons">
                <button tabindex="0" name="login" id="kc-login" type="submit" class="mdc-button mdc-button--raised mdc-card__action">
                  ${msg("doRegister")}
                </button>
              </div>
            </div>
          </div>
        </form>
        <script type="text/javascript">
        function otp() {
          var m = document.getElementById('user.attributes.mobile_number').value;
          if (m != '') {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/auth/realms/akuid/otpsms/' + m);
            xhr.onload = function() {
              if (xhr.status === 200) {
                alert('OTP Code is sent to your Mobile Phone.');
              } else {
                console.log('something went wrong ' + xhr.status);
              }
            };
            xhr.send();
          }
        }
        document.getElementById('user.attributes.mobile_number').addEventListener("input", () => {
          document.getElementById("username").value = document.getElementById("user.attributes.mobile_number").value;
        });
        </script>
    </#if>
    </@layout.registrationLayout>