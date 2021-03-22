<?xml version="1.0" encoding="utf-8"?>
<!--
Nmap Bootstrap XSL
Creative Commons BY-SA
This software must not be used by military or secret service organisations.
Andreas Hontzia (@honze_net)
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
          <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>

        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap5.min.css" rel="stylesheet" crossorigin="anonymous"/>


        <script src="https://code.jquery.com/jquery-3.5.1.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap5.min.js" crossorigin="anonymous"></script>
        <style>
        /* Adjust position of anchors, because of the fixed navbar. */
        .target:before {
          content: "";
          display: block;
          height: 2.5em;
          margin: -1em 0 0;
        }

        /* TODO: BUG: collapsing does not work currently */
        .clickable {
          cursor: pointer;
        }

        .card > h3:before {
          content: "⌄"; 
        }
          
        .card.collapsed > h3:before {
          content: "›";
        }


        /* https://github.com/xcartmods/bootstrap-5-dark-mode with some modifications*/
        [data-theme="dark"] { background-color: #111 !important; color: #fff; }

        [data-theme="dark"] a { color: #fff; }
        [data-theme="dark"] a:hover { color: #eee; }

        [data-theme="dark"] .text-dark { color: #fff !important; }

        /* BUTTONS */

        [data-theme="dark"] .btn-link { color: #fff; }
        [data-theme="dark"] .btn-close { filter: invert(1) grayscale(100%) brightness(200%); }

        [data-theme="dark"] .btn-dark { color: #000; background-color: #f8f9fa; border-color: #f8f9fa; }
        [data-theme="dark"] .btn-dark:hover { color: #000; background-color: #f9fafb; border-color: #f9fafb; }
        [data-theme="dark"] .btn-check:focus + .btn-dark,
        [data-theme="dark"] .btn-dark:focus { color: #000; background-color: #f9fafb; border-color: #f9fafb; box-shadow: 0 0 0 0.25rem rgba(211, 212, 213, 0.5); }
        [data-theme="dark"] .btn-check:checked + .btn-dark,
        [data-theme="dark"] .btn-check:active + .btn-dark,
        [data-theme="dark"] .btn-dark:active,
        [data-theme="dark"] .btn-dark.active,
        [data-theme="dark"] .show > .btn-dark.dropdown-toggle { color: #000; background-color: #f9fafb; border-color: #f9fafb; }
        [data-theme="dark"] .btn-check:checked + .btn-dark:focus,
        [data-theme="dark"] .btn-check:active + .btn-dark:focus,
        [data-theme="dark"] .btn-dark:active:focus,
        [data-theme="dark"] .btn-dark.active:focus,
        [data-theme="dark"] .show > .btn-dark.dropdown-toggle:focus { box-shadow: 0 0 0 0.25rem rgba(211, 212, 213, 0.5); }
        [data-theme="dark"] .btn-dark:disabled,
        [data-theme="dark"] .btn-dark.disabled { color: #000; background-color: #f8f9fa; border-color: #f8f9fa; }

        [data-theme="dark"] .btn-light { color: #fff; background-color: #212529; border-color: #212529; }
        [data-theme="dark"] .btn-light:hover { color: #fff; background-color: #1c1f23; border-color: #1a1e21; }
        [data-theme="dark"] .btn-check:focus + .btn-light,
        [data-theme="dark"] .btn-light:focus { color: #fff; background-color: #1c1f23; border-color: #1a1e21; box-shadow: 0 0 0 0.25rem rgba(66, 70, 73, 0.5); }
        [data-theme="dark"] .btn-check:checked + .btn-light,
        [data-theme="dark"] .btn-check:active + .btn-light,
        [data-theme="dark"] .btn-light:active,
        [data-theme="dark"] .btn-light.active,
        [data-theme="dark"] .show > .btn-light.dropdown-toggle { color: #fff; background-color: #1a1e21; border-color: #191c1f; }
        [data-theme="dark"] .btn-check:checked + .btn-light:focus,
        [data-theme="dark"] .btn-check:active + .btn-light:focus,
        [data-theme="dark"] .btn-light:active:focus,
        [data-theme="dark"] .btn-light.active:focus,
        [data-theme="dark"] .show > .btn-light.dropdown-toggle:focus { box-shadow: 0 0 0 0.25rem rgba(66, 70, 73, 0.5); }
        [data-theme="dark"] .btn-light:disabled,
        [data-theme="dark"] .btn-light.disabled { color: #fff; background-color: #212529; border-color: #212529; }

        [data-theme="dark"] .btn-outline-dark { color: #f8f9fa; border-color: #f8f9fa; }
        [data-theme="dark"] .btn-outline-dark:hover { color: #000; background-color: #f8f9fa; border-color: #f8f9fa; }
        [data-theme="dark"] .btn-check:focus + .btn-outline-dark,
        [data-theme="dark"] .btn-outline-dark:focus { box-shadow: 0 0 0 0.25rem rgba(248, 249, 250, 0.5); }
        [data-theme="dark"] .btn-check:checked + .btn-outline-dark,
        [data-theme="dark"] .btn-check:active + .btn-outline-dark,
        [data-theme="dark"] .btn-outline-dark:active,
        [data-theme="dark"] .btn-outline-dark.active,
        [data-theme="dark"] .btn-outline-dark.dropdown-toggle.show { color: #000; background-color: #f8f9fa; border-color: #f8f9fa; }
        [data-theme="dark"] .btn-check:checked + .btn-outline-dark:focus,
        [data-theme="dark"] .btn-check:active + .btn-outline-dark:focus,
        [data-theme="dark"] .btn-outline-dark:active:focus,
        [data-theme="dark"] .btn-outline-dark.active:focus,
        [data-theme="dark"] .btn-outline-dark.dropdown-toggle.show:focus { box-shadow: 0 0 0 0.25rem rgba(248, 249, 250, 0.5); }
        [data-theme="dark"] .btn-outline-dark:disabled,
        [data-theme="dark"] .btn-outline-dark.disabled { color: #f8f9fa; background-color: transparent; }

        [data-theme="dark"] .btn-outline-light { color: #212529; border-color: #212529; }
        [data-theme="dark"] .btn-outline-light:hover { color: #fff; background-color: #212529; border-color: #212529; }
        [data-theme="dark"] .btn-check:focus + .btn-outline-light,
        [data-theme="dark"] .btn-outline-light:focus { box-shadow: 0 0 0 0.25rem rgba(33, 37, 41, 0.5); }
        [data-theme="dark"] .btn-check:checked + .btn-outline-light,
        [data-theme="dark"] .btn-check:active + .btn-outline-light,
        [data-theme="dark"] .btn-outline-light:active,
        [data-theme="dark"] .btn-outline-light.active,
        [data-theme="dark"] .btn-outline-light.dropdown-toggle.show { color: #fff; background-color: #212529; border-color: #212529; }
        [data-theme="dark"] .btn-check:checked + .btn-outline-light:focus,
        [data-theme="dark"] .btn-check:active + .btn-outline-light:focus,
        [data-theme="dark"] .btn-outline-light:active:focus,
        [data-theme="dark"] .btn-outline-light.active:focus,
        [data-theme="dark"] .btn-outline-light.dropdown-toggle.show:focus { box-shadow: 0 0 0 0.25rem rgba(33, 37, 41, 0.5); }
        [data-theme="dark"] .btn-outline-light:disabled,
        [data-theme="dark"] .btn-outline-light.disabled { color: #212529; background-color: transparent; }

        /* NAVBARS */

        [data-theme="dark"] .navbar-light .navbar-nav .nav-link { color: rgba(255,255,255,.55)}
        [data-theme="dark"] .navbar-light .navbar-nav .nav-link:hover, 
        [data-theme="dark"] .navbar-light .navbar-nav .nav-link:active { color: rgba(255,255,255,.7)}


        /* DROPDOWNS */

        [data-theme="dark"] .dropdown-menu { color: #dee2e6; background-color: #343a40; border-color: rgba(0, 0, 0, 0.15); }
        [data-theme="dark"] .dropdown-menu .dropdown-item { color: #dee2e6; }
        [data-theme="dark"] .dropdown-menu .dropdown-item:hover,
        [data-theme="dark"] .dropdown-menu .dropdown-item:focus { color: #fff; background-color: rgba(255, 255, 255, 0.15); }
        [data-theme="dark"] .dropdown-menu .dropdown-item.active,
        [data-theme="dark"] .dropdown-menu .dropdown-item:active { color: #fff; background-color: #0d6efd; }
        [data-theme="dark"] .dropdown-menu .dropdown-item.disabled,
        [data-theme="dark"] .dropdown-menu .dropdown-item:disabled { color: #adb5bd; }
        [data-theme="dark"] .dropdown-menu .dropdown-divider { border-color: rgba(0, 0, 0, 0.15); }
        [data-theme="dark"] .dropdown-menu .dropdown-item-text { color: #dee2e6; }
        [data-theme="dark"] .dropdown-menu .dropdown-header { color: #adb5bd; }

        /* LIST GROUPS */

        [data-theme="dark"] .list-group-item-action { color: #fff; }
        [data-theme="dark"] .list-group-item-action:hover,
        [data-theme="dark"] .list-group-item-action:focus { color: #fff; background-color: #333; }
        [data-theme="dark"] .list-group-item-action:active { color: #fff; background-color: #000; }
        [data-theme="dark"] .list-group-item { background-color: #111; border: 1px solid #333; }
        [data-theme="dark"] .list-group-item:not(:first-child) { border-top: none; }
        [data-theme="dark"] .list-group-item.disabled,
        [data-theme="dark"] .list-group-item:disabled { color: #fff; background-color: #000; }
        [data-theme="dark"] .list-group-item.active { color: #fff; background-color: #0d6efd; border-color: #0d6efd; }

        /* TABS */

        [data-theme="dark"] .nav-tabs { border-bottom: 1px solid #000; }
        [data-theme="dark"] .nav-tabs .nav-link:hover,
        [data-theme="dark"] .nav-tabs .nav-link:focus { border-color: #212529 #212529 #000; }
        [data-theme="dark"] .nav-tabs .nav-link.disabled { color: #333; }
        [data-theme="dark"] .nav-tabs .nav-link.active,
        [data-theme="dark"] .nav-tabs .nav-item.show .nav-link { color: #fff; background-color: #000; border-color: #212529 #212529 #000; }

        /* PAGINATION */

        [data-theme="dark"] .page-link { color: #fff; background-color: #111; border: 1px solid #333; }
        [data-theme="dark"] .page-link:hover { color: #fff; background-color: #333; border-color: #333; }
        [data-theme="dark"] .page-link:focus { color: #fff; background-color: #000; }
        [data-theme="dark"] .page-item.active .page-link { color: #fff; background-color: #0d6efd; border-color: #0d6efd; }
        [data-theme="dark"] .page-item.disabled .page-link { color: #fff; background-color: #000; border-color: #333; }

        /* BACKGROUNDS */

        [data-theme="dark"] .bg-light { background-color: #212529 !important; }
        [data-theme="dark"] .bg-dark { background-color: #f8f9fa !important; }
        [data-theme="dark"] .bg-white { background-color: #000 !important; }

        [data-theme="dark"] .bg-white.text-white,
        [data-theme="dark"] .bg-dark.text-white,
        [data-theme="dark"] .bg-warning.text-dark,
        [data-theme="dark"] .bg-info.text-dark { color: #212529 !important; }

        /* BORDERS */

        [data-theme="dark"] .border,
        [data-theme="dark"] .border-top,
        [data-theme="dark"] .border-end,
        [data-theme="dark"] .border-bottom,
        [data-theme="dark"] .border-start { border-color: rgba(255,255,255,0.1) !important; }


        /* TABLES */
          [data-theme="dark"] .table {color: #fff }
          [data-theme="dark"] .table-striped > tbody > tr:nth-of-type(2n+1) { color: #fff; background-color: #222}



        /* BREADCRUMB */

        [data-theme="dark"] .breadcrumb.border { border-color: #333 !important; }

        /* SHADOWS */

        [data-theme="dark"] .shadow { box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.15) !important; }
        [data-theme="dark"] .shadow-sm { box-shadow: 0 0.125rem 0.25rem rgba(255, 255, 255, 0.075) !important; }
        [data-theme="dark"] .shadow-lg { box-shadow: 0 1rem 3rem rgba(255, 255, 255, 0.175) !important; }

        /* CARDS */

        [data-theme="dark"] .card { background-color: #000; border: 1px solid rgba(255, 255, 255, 0.125); }

        /* MODALS */

        [data-theme="dark"] .modal-content { background-color: #000; border: 1px solid rgba(255, 255, 255, 0.2); }
        [data-theme="dark"] .modal-header { border-bottom: 1px solid #212529; }
        [data-theme="dark"] .modal-footer { border-top: 1px solid #212529; }

        [data-theme="dark"] .modal-backdrop.show { opacity: 0.75; }

        /* TOASTS */

        [data-theme="dark"] .toast { background-color: rgba(255, 255, 255, 0.85); border: 1px solid rgba(0, 0, 0, 0.1); box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.15); }
        [data-theme="dark"] .toast-header { color: #6c757d; background-color: rgba(255, 255, 255, 0.85); border-bottom: 1px solid rgba(0, 0, 0, 0.05); }
        [data-theme="dark"] .toast-header .btn-close { filter: invert(0) grayscale(0%) brightness(0%); }
        [data-theme="dark"] .toast-body { color: #000; }

        /* ACCORDIONS */

        [data-theme="dark"] .accordion:not(.accordion-flush) { border-top: 1px solid #333; border-top-left-radius: 0.25rem !important; border-top-right-radius: 0.25rem !important; }
        [data-theme="dark"] .accordion-button { color: #fff; background-color: #000; border: 1px solid #333; border-top: none; }
        [data-theme="dark"] .accordion-button:not(.collapsed) { color: #fff; background-color: #111; border-bottom: none; }
        [data-theme="dark"] .accordion-button::after { filter: invert(1) grayscale(100%) brightness(200%); }
        [data-theme="dark"] .accordion-collapse { border: 1px solid #333; }

        [data-theme="dark"] .accordion-flush .accordion-button { border-right: 0; border-left: 0; border-radius: 0; }
        [data-theme="dark"] .accordion-flush .accordion-collapse { border-width: 0; }
        [data-theme="dark"] .accordion-flush .accordion-item:first-of-type .accordion-button { border-top-width: 0; border-top-left-radius: 0; border-top-right-radius: 0; }
        [data-theme="dark"] .accordion-flush .accordion-item:last-of-type .accordion-button.collapsed { border-bottom-width: 0; border-bottom-right-radius: 0; border-bottom-left-radius: 0; }

        /* PROGRESS BARS */

        [data-theme="dark"] .progress { background-color: #333; }

        /* FORMS */

        [data-theme="dark"] .form-control::-webkit-input-placeholder,
        [data-theme="dark"] .form-control::-moz-placeholder,
        [data-theme="dark"] .form-control::placeholder { color: #ccc; }
        [data-theme="dark"] .form-control-plaintext { color: #ccc; }
        [data-theme="dark"] .form-control { color: #fff; background-color: #000; border: 1px solid #333; }
        [data-theme="dark"] .input-group-text { color: #fff; background-color: #333; border: 1px solid #333; }
        [data-theme="dark"] .form-select { color: #fff; border-color: #333 !important; background: #000 url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23ffffff' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e") no-repeat right 0.75rem center/8px 10px; border: 1px solid #111; }
        [data-theme="dark"] .form-select option { color: #fff; }
        [data-theme="dark"] .form-select:disabled { color: #666; background-color: #333; }
        [data-theme="dark"] .form-select:-moz-focusring { text-shadow: 0 0 0 #495057; }

        [data-theme="dark"] .form-floating > .form-control::-webkit-input-placeholder,
        [data-theme="dark"] .form-floating > .form-control::-moz-placeholder,
        [data-theme="dark"] .form-floating > .form-control::placeholder { color: transparent; }

        [data-theme="dark"] .form-floating > .form-control:not(:-moz-placeholder-shown) ~ label,
        [data-theme="dark"] .form-floating > .form-control:focus ~ label,
        [data-theme="dark"] .form-floating > .form-control:not(:placeholder-shown) ~ label,
        [data-theme="dark"] .form-floating > .form-select ~ label,
        [data-theme="dark"] .form-floating > .form-control:-webkit-autofill ~ label { opacity: 0.65; }

        [data-theme="dark"] .form-control.is-invalid, .was-validated .form-control:invalid { border-color: #dc3545; }
        [data-theme="dark"] .form-control.is-valid, .was-validated .form-control:valid { border-color: #198754; }

        [data-theme="dark"] .form-range::-webkit-slider-runnable-track { background-color: #333; }
        [data-theme="dark"] .form-range::-moz-range-thumb { background-color: #0d6efd; }
        [data-theme="dark"] .form-range::-moz-range-thumb:active { background-color: #b6d4fe; }
        [data-theme="dark"] .form-range::-moz-range-track { background-color: #333; }

        [data-theme="dark"] .form-range:disabled::-webkit-slider-thumb { background-color: #666; }
        [data-theme="dark"] .form-range:disabled::-moz-range-thumb { background-color: #666; }


        </style>
        <title>Nmap <xsl:value-of select="/nmaprun/@version"/> Scan Report</title>
      </head>
      <body>
        <!-- Optional JavaScript; choose one of the two! -->
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
          <!-- Option 2: Separate Popper and Bootstrap JS -->
          <!--
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
          -->
            <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light shadow-sm" id="navbar">
              <div class="container-fluid">
                <a class="link-secondary me-md-auto" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
              </svg></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                  <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                      <a class="nav-link" href="#scannedhosts">Scanned Hosts</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#onlinehosts">Online Hosts</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#openservices">Open Services</a>
                    </li>
                  </ul>
                  <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="darkSwitch" />
                    <label class="form-check-label" for="darkSwitch">dark mode</label>
                  </div>
                  <!-- TODO: rewrite in pretty and add auto https://github.com/coliff/dark-mode-switch -->
                  <script><![CDATA[
                  const darkSwitch=document.getElementById("darkSwitch");function initTheme(){const e=null!==localStorage.getItem("darkSwitch")&&"dark"===localStorage.getItem("darkSwitch");darkSwitch.checked=e,e?document.body.setAttribute("data-theme","dark"):document.body.removeAttribute("data-theme")}function resetTheme(){darkSwitch.checked?(document.body.setAttribute("data-theme","dark"),localStorage.setItem("darkSwitch","dark")):(document.body.removeAttribute("data-theme"),localStorage.removeItem("darkSwitch"))}window.addEventListener("load",()=>{darkSwitch&&(initTheme(),darkSwitch.addEventListener("change",()=>{resetTheme()}))});
                    ]]>
                  </script>
                </div>
              </div>
            </nav>

            <main class="container">
              <section class="bg-light mt-5 p-5 rounded">
                <h1>Nmap <xsl:value-of select="/nmaprun/@version"/> Scan Report</h1>
                <p class="lead">
                  <xsl:value-of select="/nmaprun/@startstr"/> – <xsl:value-of select="/nmaprun/runstats/finished/@timestr"/><br/>
                  <xsl:value-of select="/nmaprun/runstats/hosts/@total"/> hosts scanned.
                  <xsl:value-of select="/nmaprun/runstats/hosts/@up"/> hosts up.
                  <xsl:value-of select="/nmaprun/runstats/hosts/@down"/> hosts down.
                </p>
                <div class="progress">
                  <div class="progress-bar bg-success" style="width: 0%">
                    <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@up div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                    <xsl:value-of select="/nmaprun/runstats/hosts/@up"/>
                    <span class="sr-only"></span>
                  </div>
                  <div class="progress-bar bg-danger" style="width: 0%">
                    <xsl:attribute name="style">width:<xsl:value-of select="/nmaprun/runstats/hosts/@down div /nmaprun/runstats/hosts/@total * 100"/>%;</xsl:attribute>
                    <xsl:value-of select="/nmaprun/runstats/hosts/@down"/>
                    <span class="sr-only"></span>
                  </div>
                </div>
                <pre class="bg-light border rounded py-2 px-2 mt-3 mb-0" style="white-space:pre-wrap; word-wrap:break-word;"><code><xsl:value-of select="/nmaprun/@args"/></code></pre>
                <!-- TODO: Find out, if this is really beneficial.
                <a href="#" class="link-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
                    <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                    <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                  </svg> copy</a>
                -->
              </section>
              <section>
                <h2 id="scannedhosts" class="target">Scanned Hosts<xsl:if test="/nmaprun/runstats/hosts/@down > 1024"><small> (offline hosts are hidden)</small></xsl:if></h2>
                <div class="table-responsive">
                  <table id="table-overview" class="table table-striped dataTable" role="grid">
                    <thead>
                      <tr>
                        <th>State</th>
                        <th>Reason</th>
                        <th>Address</th>
                        <th>Hostname</th>
                        <th>TCP (open)</th>
                        <th>UDP (open)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:choose>
                        <xsl:when test="/nmaprun/runstats/hosts/@down > 1024">
                          <xsl:for-each select="/nmaprun/host[status/@state='up']">
                            <tr>
                              <td><span class="badge bg-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">badge bg-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                              <td><xsl:value-of select="status/@reason"/></td>
                              <td><xsl:value-of select="address/@addr"/></td>
                              <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                              <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                              <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                            </tr>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:for-each select="/nmaprun/host">
                            <tr>
                              <td><span class="badge bg-danger"><xsl:if test="status/@state='up'"><xsl:attribute name="class">badge bg-success</xsl:attribute></xsl:if><xsl:value-of select="status/@state"/></span></td>
                              <td><xsl:value-of select="status/@reason"/></td>
                              <td><xsl:value-of select="address/@addr"/></td>
                              <td><xsl:value-of select="hostnames/hostname/@name"/></td>
                              <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='tcp'])"/></td>
                              <td><xsl:value-of select="count(ports/port[state/@state='open' and @protocol='udp'])"/></td>
                            </tr>
                          </xsl:for-each>
                        </xsl:otherwise>
                      </xsl:choose>
                    </tbody>
                  </table>
                </div>
                <script>
                  $(document).ready(function() {
                    $('#table-overview').DataTable();
                  } );
                  $('#table-overview').DataTable( {
                    "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ]
                  });
                </script>
              </section>
              <section>
                <h2 id="onlinehosts" class="target">Online Hosts</h2>
                <xsl:for-each select="/nmaprun/host[status/@state='up']">
                  <div class="card mb-5">
                    <h3 class="card-header bg-dark text-white clickable" data-bs-toggle="collapse">
                      <xsl:attribute name="data-bs-target">#<xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                      <xsl:attribute name="aria-controls"><xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                      <xsl:value-of select="address/@addr"/><xsl:if test="count(hostnames/hostname) > 0"> - <xsl:value-of select="hostnames/hostname/@name"/></xsl:if>
                      <small style="float:right"><xsl:value-of select="status/@reason"/></small>
                    </h3>
                    <div class="card-body collapse show"> <!-- TODO: fix class collapse bootstrap bug -->
                      <xsl:attribute name="id"><xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                      <xsl:attribute name="aria-controls"><xsl:value-of select="translate(address/@addr, '.', '-')"/></xsl:attribute>
                      <xsl:if test="count(hostnames/hostname) > 0">
                        <h4>Hostnames</h4>
                        <ul>
                          <xsl:for-each select="hostnames/hostname">
                            <li><xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>)</li>
                          </xsl:for-each>
                        </ul>
                      </xsl:if>

                      <h4>Ports</h4>
                      <xsl:for-each select="ports/port">
                        <div class="card mb-2">
                          <h5>
                            <xsl:attribute name="class">
                              card-header
                              <xsl:if test="state/@state = 'open'"> bg-success text-light</xsl:if>
                              <xsl:if test="state/@state = 'filtered'"> bg-warning</xsl:if>
                              <xsl:if test="state/@state = 'unfiltered'"> bg-warning</xsl:if>
                              <xsl:if test="state/@state = 'open|filtered'"> bg-warning</xsl:if>
                              <xsl:if test="state/@state = 'closed|filtered'"> bg-warning</xsl:if>
                              <xsl:if test="state/@state = 'unknown'"> bg-info</xsl:if>

                            </xsl:attribute>


                            <xsl:value-of select="@portid"/> / <xsl:value-of select="@protocol"/> - <xsl:value-of select="service/@name"/> <small style="float:right"><xsl:value-of select="state/@state"/> - <xsl:value-of select="state/@reason"/></small></h5>
                          <xsl:choose>
                            <xsl:when test="state/@state = 'open'">
                              <div class="card-body">
                                <p class="card-text">
                                  Product: <xsl:value-of select="service/@product"/><br/>
                                  Version: <xsl:value-of select="service/@version"/><br/>
                                  Extra Info: <xsl:value-of select="service/@extrainfo"/><br/>
                                  <xsl:for-each select="service/cpe">
                                    <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="."/></xsl:attribute><xsl:value-of select="."/></a><br/>
                                  </xsl:for-each>
                                </p>
                                <xsl:for-each select="script">
                                  <h6><xsl:value-of select="@id"/></h6>
                                  <pre class="bg-light border rounded py-2 px-2" style="white-space:pre-wrap; word-wrap:break-word;"><xsl:value-of select="@output"/></pre>
                                </xsl:for-each>
                              </div>
                            </xsl:when>
                          </xsl:choose>
                        </div>
                      </xsl:for-each>


                      <xsl:if test="count(os/osmatch) > 0">
                        <h4>OS Detection</h4>
                        <xsl:for-each select="os/osmatch">
                          <h5>OS details: <xsl:value-of select="@name"/> (<xsl:value-of select="@accuracy"/>%)</h5>
                          <xsl:for-each select="osclass">
                            Device type: <xsl:value-of select="@type"/><br/>
                            Running: <xsl:value-of select="@vendor"/><xsl:text> </xsl:text><xsl:value-of select="@osfamily"/><xsl:text> </xsl:text><xsl:value-of select="@osgen"/> (<xsl:value-of select="@accuracy"/>%)<br/>
                            OS CPE: <a><xsl:attribute name="href">https://nvd.nist.gov/vuln/search/results?form_type=Advanced&amp;cves=on&amp;cpe_version=<xsl:value-of select="cpe"/></xsl:attribute><xsl:value-of select="cpe"/></a>
                            <br/>
                          </xsl:for-each>
                          <br/>
                        </xsl:for-each>
                      </xsl:if>
                    </div>
                  </div>
                </xsl:for-each>
              </section>
              <section>
                <h2 id="openservices" class="target">Open Services</h2>
                <div class="table-responsive">
                  <table id="table-services" class="table table-striped dataTable" role="grid">
                    <thead>
                      <tr>
                        <th>Address</th>
                        <th>Port</th>
                        <th>Protocol</th>
                        <th>Service</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>CPE</th>
                        <th>Extra info</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="/nmaprun/host">
                        <xsl:for-each select="ports/port[state/@state='open']">
                          <tr>
                            <td><xsl:value-of select="../../address/@addr"/><xsl:if test="count(../../hostnames/hostname) > 0"> - <xsl:value-of select="../../hostnames/hostname/@name"/></xsl:if></td>
                            <td><xsl:value-of select="@portid"/></td>
                            <td><xsl:value-of select="@protocol"/></td>
                            <td><xsl:value-of select="service/@name"/></td>
                            <td><xsl:value-of select="service/@product"/></td>
                            <td><xsl:value-of select="service/@version"/></td>
                            <td><xsl:value-of select="service/cpe"/></td>
                            <td><xsl:value-of select="service/@extrainfo"/></td>
                          </tr>
                        </xsl:for-each>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
                <script>
                  $(document).ready(function() {
                  $('#table-services').DataTable();
                  });
                  $('#table-services').DataTable( {
                  "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ]
                  });
                </script>
              </section>
            </main>
            <footer class="footer bg-light py-5 mt-5">
              <div class="container">
                <p class="text-muted">
                  This report was generated with <a href="https://github.com/honze-net/nmap-bootstrap-xsl">Nmap Bootstrap XSL</a>.<br/>
                  Licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons BY-SA</a>.<br/>
                  Designed and built by Andreas Hontzia (<a href="https://www.twitter.com/honze_net">@honze_net</a>).
                </p>
              </div>
            </footer>
          </body>
        </html>
      </xsl:template>
    </xsl:stylesheet>      
