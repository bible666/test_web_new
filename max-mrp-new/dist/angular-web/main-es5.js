function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"], {
  /***/
  "./$$_lazy_route_resource lazy recursive":
  /*!******************************************************!*\
    !*** ./$$_lazy_route_resource lazy namespace object ***!
    \******************************************************/

  /*! no static exports found */

  /***/
  function $$_lazy_route_resourceLazyRecursive(module, exports) {
    function webpackEmptyAsyncContext(req) {
      // Here Promise.resolve().then() is used instead of new Promise() to prevent
      // uncaught exception popping up in devtools
      return Promise.resolve().then(function () {
        var e = new Error("Cannot find module '" + req + "'");
        e.code = 'MODULE_NOT_FOUND';
        throw e;
      });
    }

    webpackEmptyAsyncContext.keys = function () {
      return [];
    };

    webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
    module.exports = webpackEmptyAsyncContext;
    webpackEmptyAsyncContext.id = "./$$_lazy_route_resource lazy recursive";
    /***/
  },

  /***/
  "./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html":
  /*!**************************************************************************!*\
    !*** ./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html ***!
    \**************************************************************************/

  /*! exports provided: default */

  /***/
  function node_modulesRawLoaderDistCjsJsSrcAppAppComponentHtml(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "<div class=\"wrapper\">\n\n    <!-- Navbar -->\n    <nav class=\"main-header navbar navbar-expand navbar-white navbar-light\">\n      <!-- Left navbar links -->\n      <ul class=\"navbar-nav\">\n        <li class=\"nav-item\">\n          <a class=\"nav-link\" data-widget=\"pushmenu\" href=\"#\" role=\"button\"><i class=\"fas fa-bars\"></i></a>\n        </li>\n        <li class=\"nav-item d-none d-sm-inline-block\">\n          \n          <a routerLink = \"/common/templateIndex\" class=\"nav-link\">Home</a>\n        </li>\n        <li class=\"nav-item d-none d-sm-inline-block\">\n          <a routerLink = \"/common/templateIndex\" class=\"nav-link\">Contact</a>\n        </li>\n      </ul>\n\n      <!-- SEARCH FORM -->\n      <form class=\"form-inline ml-3\">\n        <div class=\"input-group input-group-sm\">\n          <input class=\"form-control form-control-navbar\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n          <div class=\"input-group-append\">\n            <button class=\"btn btn-navbar\" type=\"submit\">\n              <i class=\"fas fa-search\"></i>\n            </button>\n          </div>\n        </div>\n      </form>\n\n      <!-- Right navbar links -->\n      <ul class=\"navbar-nav ml-auto\">\n        <!-- Messages Dropdown Menu -->\n        <li class=\"nav-item dropdown\">\n          <a class=\"nav-link\" data-toggle=\"dropdown\" href=\"#\">\n            <i class=\"far fa-comments\"></i>\n            <span class=\"badge badge-danger navbar-badge\">3</span>\n          </a>\n          <div class=\"dropdown-menu dropdown-menu-lg dropdown-menu-right\">\n            <a href=\"#\" class=\"dropdown-item\">\n              <!-- Message Start -->\n              <div class=\"media\">\n                <img src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"User Avatar\" class=\"img-size-50 mr-3 img-circle\">\n                <div class=\"media-body\">\n                  <h3 class=\"dropdown-item-title\">\n                    Brad Diesel\n                    <span class=\"float-right text-sm text-danger\"><i class=\"fas fa-star\"></i></span>\n                  </h3>\n                  <p class=\"text-sm\">Call me whenever you can...</p>\n                  <p class=\"text-sm text-muted\"><i class=\"far fa-clock mr-1\"></i> 4 Hours Ago</p>\n                </div>\n              </div>\n              <!-- Message End -->\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item\">\n              <!-- Message Start -->\n              <div class=\"media\">\n                <img src=\"./assets/dist/img/user8-128x128.jpg\" alt=\"User Avatar\" class=\"img-size-50 img-circle mr-3\">\n                <div class=\"media-body\">\n                  <h3 class=\"dropdown-item-title\">\n                    John Pierce\n                    <span class=\"float-right text-sm text-muted\"><i class=\"fas fa-star\"></i></span>\n                  </h3>\n                  <p class=\"text-sm\">I got your message bro</p>\n                  <p class=\"text-sm text-muted\"><i class=\"far fa-clock mr-1\"></i> 4 Hours Ago</p>\n                </div>\n              </div>\n              <!-- Message End -->\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item\">\n              <!-- Message Start -->\n              <div class=\"media\">\n                <img src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"User Avatar\" class=\"img-size-50 img-circle mr-3\">\n                <div class=\"media-body\">\n                  <h3 class=\"dropdown-item-title\">\n                    Nora Silvester\n                    <span class=\"float-right text-sm text-warning\"><i class=\"fas fa-star\"></i></span>\n                  </h3>\n                  <p class=\"text-sm\">The subject goes here</p>\n                  <p class=\"text-sm text-muted\"><i class=\"far fa-clock mr-1\"></i> 4 Hours Ago</p>\n                </div>\n              </div>\n              <!-- Message End -->\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item dropdown-footer\">See All Messages</a>\n          </div>\n        </li>\n        <!-- Notifications Dropdown Menu -->\n        <li class=\"nav-item dropdown\">\n          <a class=\"nav-link\" data-toggle=\"dropdown\" href=\"#\">\n            <i class=\"far fa-bell\"></i>\n            <span class=\"badge badge-warning navbar-badge\">15</span>\n          </a>\n          <div class=\"dropdown-menu dropdown-menu-lg dropdown-menu-right\">\n            <span class=\"dropdown-item dropdown-header\">15 Notifications</span>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item\">\n              <i class=\"fas fa-envelope mr-2\"></i> 4 new messages\n              <span class=\"float-right text-muted text-sm\">3 mins</span>\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item\">\n              <i class=\"fas fa-users mr-2\"></i> 8 friend requests\n              <span class=\"float-right text-muted text-sm\">12 hours</span>\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item\">\n              <i class=\"fas fa-file mr-2\"></i> 3 new reports\n              <span class=\"float-right text-muted text-sm\">2 days</span>\n            </a>\n            <div class=\"dropdown-divider\"></div>\n            <a href=\"#\" class=\"dropdown-item dropdown-footer\">See All Notifications</a>\n          </div>\n        </li>\n        <li class=\"nav-item\">\n          <a class=\"nav-link\" data-widget=\"fullscreen\" href=\"#\" role=\"button\">\n            <i class=\"fas fa-expand-arrows-alt\"></i>\n          </a>\n        </li>\n        </li>\n      </ul>\n    </nav>\n    <!-- /.navbar -->\n\n    <!-- Main Sidebar Container -->\n    <aside class=\"main-sidebar sidebar-dark-primary elevation-4\">\n      <!-- Brand Logo -->\n      <a href=\"index3.html\" class=\"brand-link\">\n        <img src=\"./assets/dist/img/AdminLTELogo.png\" alt=\"AdminLTE Logo\" class=\"brand-image img-circle elevation-3\" style=\"opacity: .8\">\n        <span class=\"brand-text font-weight-light\">AdminLTE 3</span>\n      </a>\n\n      <!-- Sidebar -->\n      <div class=\"sidebar\">\n        <!-- Sidebar user panel (optional) -->\n        <div class=\"user-panel mt-3 pb-3 mb-3 d-flex\">\n          <div class=\"image\">\n            <img src=\"./assets/dist/img/user2-160x160.jpg\" class=\"img-circle elevation-2\" alt=\"User Image\">\n          </div>\n          <div class=\"info\">\n            <a href=\"#\" class=\"d-block\">Alexander Pierce</a>\n          </div>\n        </div>\n\n        <!-- SidebarSearch Form -->\n        <div class=\"form-inline\">\n          <div class=\"input-group\" data-widget=\"sidebar-search\">\n            <input class=\"form-control form-control-sidebar\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n            <div class=\"input-group-append\">\n              <button class=\"btn btn-sidebar\">\n                <i class=\"fas fa-search fa-fw\"></i>\n              </button>\n            </div>\n          </div>\n        </div>\n\n        <!-- Sidebar Menu -->\n        <nav class=\"mt-2\">\n          <ul class=\"nav nav-pills nav-sidebar flex-column\" data-widget=\"treeview\" role=\"menu\" data-accordion=\"false\">\n            <!-- Add icons to the links using the .nav-icon class\n                with font-awesome or any other icon font library -->\n            <li class=\"nav-item menu-open\">\n              <a href=\"#\" class=\"nav-link active\">\n                <i class=\"nav-icon fas fa-tachometer-alt\"></i>\n                <p>\n                  Dashboard\n                  <i class=\"right fas fa-angle-left\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a routerLink = \"/common/templateIndex\" class=\"nav-link active\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Dashboard v1</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a routerLink = \"/common/templateIndex2\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Dashboard v2</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"./index3.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Dashboard v3</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"pages/widgets.html\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-th\"></i>\n                <p>\n                  Widgets\n                  <span class=\"right badge badge-danger\">New</span>\n                </p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-copy\"></i>\n                <p>\n                  Layout Options\n                  <i class=\"fas fa-angle-left right\"></i>\n                  <span class=\"badge badge-info right\">6</span>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/top-nav.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Top Navigation</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/top-nav-sidebar.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Top Navigation + Sidebar</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/boxed.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Boxed</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/fixed-sidebar.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Fixed Sidebar</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/fixed-sidebar-custom.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Fixed Sidebar <small>+ Custom Area</small></p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/fixed-topnav.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Fixed Navbar</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/fixed-footer.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Fixed Footer</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/layout/collapsed-sidebar.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Collapsed Sidebar</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-chart-pie\"></i>\n                <p>\n                  Charts\n                  <i class=\"right fas fa-angle-left\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/charts/chartjs.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>ChartJS</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/charts/flot.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Flot</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/charts/inline.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Inline</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-tree\"></i>\n                <p>\n                  UI Elements\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/general.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>General</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/icons.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Icons</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/buttons.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Buttons</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/sliders.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Sliders</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/modals.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Modals & Alerts</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/navbar.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Navbar & Tabs</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/timeline.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Timeline</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/UI/ribbons.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Ribbons</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-edit\"></i>\n                <p>\n                  Forms\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/forms/general.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>General Elements</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/forms/advanced.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Advanced Elements</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/forms/editors.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Editors</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/forms/validation.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Validation</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-table\"></i>\n                <p>\n                  Tables\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/tables/simple.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Simple Tables</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/tables/data.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>DataTables</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/tables/jsgrid.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>jsGrid</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-header\">EXAMPLES</li>\n            <li class=\"nav-item\">\n              <a href=\"pages/calendar.html\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-calendar-alt\"></i>\n                <p>\n                  Calendar\n                  <span class=\"badge badge-info right\">2</span>\n                </p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"pages/gallery.html\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-image\"></i>\n                <p>\n                  Gallery\n                </p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-envelope\"></i>\n                <p>\n                  Mailbox\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/mailbox/mailbox.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Inbox</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/mailbox/compose.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Compose</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/mailbox/read-mail.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Read</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-book\"></i>\n                <p>\n                  Pages\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/invoice.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Invoice</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/profile.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Profile</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/e-commerce.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>E-commerce</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/projects.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Projects</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/project-add.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Project Add</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/project-edit.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Project Edit</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/project-detail.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Project Detail</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/contacts.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Contacts</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-plus-square\"></i>\n                <p>\n                  Extras\n                  <i class=\"fas fa-angle-left right\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/login.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Login</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/register.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Register</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/forgot-password.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Forgot Password</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/recover-password.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Recover Password</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/lockscreen.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Lockscreen</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/legacy-user-menu.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Legacy User Menu</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/language-menu.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Language Menu</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/404.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Error 404</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/500.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Error 500</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/pace.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Pace</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"pages/examples/blank.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Blank Page</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"starter.html\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Starter Page</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-header\">MISCELLANEOUS</li>\n            <li class=\"nav-item\">\n              <a href=\"https://adminlte.io/docs/3.0/\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-file\"></i>\n                <p>Documentation</p>\n              </a>\n            </li>\n            <li class=\"nav-header\">MULTI LEVEL EXAMPLE</li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"fas fa-circle nav-icon\"></i>\n                <p>Level 1</p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon fas fa-circle\"></i>\n                <p>\n                  Level 1\n                  <i class=\"right fas fa-angle-left\"></i>\n                </p>\n              </a>\n              <ul class=\"nav nav-treeview\">\n                <li class=\"nav-item\">\n                  <a href=\"#\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Level 2</p>\n                  </a>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"#\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>\n                      Level 2\n                      <i class=\"right fas fa-angle-left\"></i>\n                    </p>\n                  </a>\n                  <ul class=\"nav nav-treeview\">\n                    <li class=\"nav-item\">\n                      <a href=\"#\" class=\"nav-link\">\n                        <i class=\"far fa-dot-circle nav-icon\"></i>\n                        <p>Level 3</p>\n                      </a>\n                    </li>\n                    <li class=\"nav-item\">\n                      <a href=\"#\" class=\"nav-link\">\n                        <i class=\"far fa-dot-circle nav-icon\"></i>\n                        <p>Level 3</p>\n                      </a>\n                    </li>\n                    <li class=\"nav-item\">\n                      <a href=\"#\" class=\"nav-link\">\n                        <i class=\"far fa-dot-circle nav-icon\"></i>\n                        <p>Level 3</p>\n                      </a>\n                    </li>\n                  </ul>\n                </li>\n                <li class=\"nav-item\">\n                  <a href=\"#\" class=\"nav-link\">\n                    <i class=\"far fa-circle nav-icon\"></i>\n                    <p>Level 2</p>\n                  </a>\n                </li>\n              </ul>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"fas fa-circle nav-icon\"></i>\n                <p>Level 1</p>\n              </a>\n            </li>\n            <li class=\"nav-header\">LABELS</li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-circle text-danger\"></i>\n                <p class=\"text\">Important</p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-circle text-warning\"></i>\n                <p>Warning</p>\n              </a>\n            </li>\n            <li class=\"nav-item\">\n              <a href=\"#\" class=\"nav-link\">\n                <i class=\"nav-icon far fa-circle text-info\"></i>\n                <p>Informational</p>\n              </a>\n            </li>\n          </ul>\n        </nav>\n        <!-- /.sidebar-menu -->\n      </div>\n      <!-- /.sidebar -->\n    </aside>\n    \n    <!-- Content Wrapper. Contains page content -->\n    <router-outlet></router-outlet>\n\n    <!-- /.content-wrapper -->\n    <footer class=\"main-footer\">\n      <strong>Copyright &copy; 2014-2020 My IO</strong>\n      All rights reserved.\n      <div class=\"float-right d-none d-sm-inline-block\">\n        <b>Version</b> 0.0.0\n      </div>\n    </footer>\n\n    <!-- Control Sidebar -->\n    <aside class=\"control-sidebar control-sidebar-dark\">\n      <!-- Control sidebar content goes here -->\n    </aside>\n    <!-- /.control-sidebar -->\n</div>\n<!-- ./wrapper -->\n";
    /***/
  },

  /***/
  "./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index/template-index.component.html":
  /*!***********************************************************************************************************!*\
    !*** ./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index/template-index.component.html ***!
    \***********************************************************************************************************/

  /*! exports provided: default */

  /***/
  function node_modulesRawLoaderDistCjsJsSrcAppCommonTemplateIndexTemplateIndexComponentHtml(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "<div class=\"content-wrapper\">\n    \n    \n    <!-- Content Header (Page header) -->\n    <div class=\"content-header\">\n        <div class=\"container-fluid\">\n            <div class=\"row mb-2\">\n                <div class=\"col-sm-6\">\n                    <h1 class=\"m-0 text-dark\">Dashboard</h1>\n                    \n                </div><!-- /.col -->\n                <div class=\"col-sm-6\">\n                    <ol class=\"breadcrumb float-sm-right\">\n                    <li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>\n                    <li class=\"breadcrumb-item active\">Dashboard v1</li>\n                    </ol>\n                </div><!-- /.col -->\n            </div><!-- /.row -->\n        </div><!-- /.container-fluid -->\n    </div>\n    <!-- /.content-header -->\n\n    <!-- Main content -->\n    <section class=\"content\">\n        <div class=\"container-fluid\">\n            <!-- Small boxes (Stat box) -->\n            <div class=\"row\">\n            <div class=\"col-lg-3 col-6\">\n                <!-- small box -->\n                <div class=\"small-box bg-info\">\n                <div class=\"inner\">\n                    <h3>150</h3>\n\n                    <p>New Orders</p>\n                </div>\n                <div class=\"icon\">\n                    <i class=\"ion ion-bag\"></i>\n                </div>\n                <a href=\"#\" class=\"small-box-footer\">More info <i class=\"fas fa-arrow-circle-right\"></i></a>\n                </div>\n            </div>\n            <!-- ./col -->\n            <div class=\"col-lg-3 col-6\">\n                <!-- small box -->\n                <div class=\"small-box bg-success\">\n                <div class=\"inner\">\n                    <h3>53<sup style=\"font-size: 20px\">%</sup></h3>\n\n                    <p>Bounce Rate</p>\n                </div>\n                <div class=\"icon\">\n                    <i class=\"ion ion-stats-bars\"></i>\n                </div>\n                <a href=\"#\" class=\"small-box-footer\">More info <i class=\"fas fa-arrow-circle-right\"></i></a>\n                </div>\n            </div>\n            <!-- ./col -->\n            <div class=\"col-lg-3 col-6\">\n                <!-- small box -->\n                <div class=\"small-box bg-warning\">\n                <div class=\"inner\">\n                    <h3>44</h3>\n\n                    <p>User Registrations</p>\n                </div>\n                <div class=\"icon\">\n                    <i class=\"ion ion-person-add\"></i>\n                </div>\n                <a href=\"#\" class=\"small-box-footer\">More info <i class=\"fas fa-arrow-circle-right\"></i></a>\n                </div>\n            </div>\n            <!-- ./col -->\n            <div class=\"col-lg-3 col-6\">\n                <!-- small box -->\n                <div class=\"small-box bg-danger\">\n                <div class=\"inner\">\n                    <h3>65</h3>\n\n                    <p>Unique Visitors</p>\n                </div>\n                <div class=\"icon\">\n                    <i class=\"ion ion-pie-graph\"></i>\n                </div>\n                <a href=\"#\" class=\"small-box-footer\">More info <i class=\"fas fa-arrow-circle-right\"></i></a>\n                </div>\n            </div>\n            <!-- ./col -->\n            </div>\n            <!-- /.row -->\n            <!-- Main row -->\n            <div class=\"row\">\n            <!-- Left col -->\n            <section class=\"col-lg-7 connectedSortable\">\n                <!-- Custom tabs (Charts with tabs)-->\n                <div class=\"card\">\n                <div class=\"card-header\">\n                    <h3 class=\"card-title\">\n                    <i class=\"fas fa-chart-pie mr-1\"></i>\n                    Sales\n                    </h3>\n                    <div class=\"card-tools\">\n                    <ul class=\"nav nav-pills ml-auto\">\n                        <li class=\"nav-item\">\n                        <a class=\"nav-link active\" href=\"#revenue-chart\" data-toggle=\"tab\">Area</a>\n                        </li>\n                        <li class=\"nav-item\">\n                        <a class=\"nav-link\" href=\"#sales-chart\" data-toggle=\"tab\">Donut</a>\n                        </li>\n                    </ul>\n                    </div>\n                </div><!-- /.card-header -->\n                <div class=\"card-body\">\n                    <div class=\"tab-content p-0\">\n                    <!-- Morris chart - Sales -->\n                    <div class=\"chart tab-pane active\" id=\"revenue-chart\"\n                        style=\"position: relative; height: 300px;\">\n                        <canvas id=\"revenue-chart-canvas\" height=\"300\" style=\"height: 300px;\"></canvas>\n                    </div>\n                    <div class=\"chart tab-pane\" id=\"sales-chart\" style=\"position: relative; height: 300px;\">\n                        <canvas id=\"sales-chart-canvas\" height=\"300\" style=\"height: 300px;\"></canvas>\n                    </div>\n                    </div>\n                </div><!-- /.card-body -->\n                </div>\n                <!-- /.card -->\n\n                <!-- DIRECT CHAT -->\n                <div class=\"card direct-chat direct-chat-primary\">\n                <div class=\"card-header\">\n                    <h3 class=\"card-title\">Direct Chat</h3>\n\n                    <div class=\"card-tools\">\n                    <span title=\"3 New Messages\" class=\"badge badge-primary\">3</span>\n                    <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                    </button>\n                    <button type=\"button\" class=\"btn btn-tool\" title=\"Contacts\" data-widget=\"chat-pane-toggle\">\n                        <i class=\"fas fa-comments\"></i>\n                    </button>\n                    <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                        <i class=\"fas fa-times\"></i>\n                    </button>\n                    </div>\n                </div>\n                <!-- /.card-header -->\n                <div class=\"card-body\">\n                    <!-- Conversations are loaded here -->\n                    <div class=\"direct-chat-messages\">\n                    <!-- Message. Default to the left -->\n                    <div class=\"direct-chat-msg\">\n                        <div class=\"direct-chat-infos clearfix\">\n                        <span class=\"direct-chat-name float-left\">Alexander Pierce</span>\n                        <span class=\"direct-chat-timestamp float-right\">23 Jan 2:00 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                        Is this template really for free? That's unbelievable!\n                        </div>\n                        <!-- /.direct-chat-text -->\n                    </div>\n                    <!-- /.direct-chat-msg -->\n\n                    <!-- Message to the right -->\n                    <div class=\"direct-chat-msg right\">\n                        <div class=\"direct-chat-infos clearfix\">\n                        <span class=\"direct-chat-name float-right\">Sarah Bullock</span>\n                        <span class=\"direct-chat-timestamp float-left\">23 Jan 2:05 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                        You better believe it!\n                        </div>\n                        <!-- /.direct-chat-text -->\n                    </div>\n                    <!-- /.direct-chat-msg -->\n\n                    <!-- Message. Default to the left -->\n                    <div class=\"direct-chat-msg\">\n                        <div class=\"direct-chat-infos clearfix\">\n                        <span class=\"direct-chat-name float-left\">Alexander Pierce</span>\n                        <span class=\"direct-chat-timestamp float-right\">23 Jan 5:37 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                        Working with AdminLTE on a great new app! Wanna join?\n                        </div>\n                        <!-- /.direct-chat-text -->\n                    </div>\n                    <!-- /.direct-chat-msg -->\n\n                    <!-- Message to the right -->\n                    <div class=\"direct-chat-msg right\">\n                        <div class=\"direct-chat-infos clearfix\">\n                        <span class=\"direct-chat-name float-right\">Sarah Bullock</span>\n                        <span class=\"direct-chat-timestamp float-left\">23 Jan 6:10 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                        I would love to.\n                        </div>\n                        <!-- /.direct-chat-text -->\n                    </div>\n                    <!-- /.direct-chat-msg -->\n\n                    </div>\n                    <!--/.direct-chat-messages-->\n\n                    <!-- Contacts are loaded here -->\n                    <div class=\"direct-chat-contacts\">\n                    <ul class=\"contacts-list\">\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                Count Dracula\n                                <small class=\"contacts-list-date float-right\">2/28/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">How have you been? I was...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user7-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                Sarah Doe\n                                <small class=\"contacts-list-date float-right\">2/23/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">I will be waiting for...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                Nadia Jolie\n                                <small class=\"contacts-list-date float-right\">2/20/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">I'll call you back at...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user5-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                Nora S. Vans\n                                <small class=\"contacts-list-date float-right\">2/10/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">Where is your new...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user6-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                John K.\n                                <small class=\"contacts-list-date float-right\">1/27/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">Can I take a look at...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                        <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user8-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                            <span class=\"contacts-list-name\">\n                                Kenneth M.\n                                <small class=\"contacts-list-date float-right\">1/4/2015</small>\n                            </span>\n                            <span class=\"contacts-list-msg\">Never mind I found...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                        </a>\n                        </li>\n                        <!-- End Contact Item -->\n                    </ul>\n                    <!-- /.contacts-list -->\n                    </div>\n                    <!-- /.direct-chat-pane -->\n                </div>\n                <!-- /.card-body -->\n                <div class=\"card-footer\">\n                    <form action=\"#\" method=\"post\">\n                    <div class=\"input-group\">\n                        <input type=\"text\" name=\"message\" placeholder=\"Type Message ...\" class=\"form-control\">\n                        <span class=\"input-group-append\">\n                        <button type=\"button\" class=\"btn btn-primary\">Send</button>\n                        </span>\n                    </div>\n                    </form>\n                </div>\n                <!-- /.card-footer-->\n                </div>\n                <!--/.direct-chat -->\n\n                <!-- TO DO List -->\n                <div class=\"card\">\n                <div class=\"card-header\">\n                    <h3 class=\"card-title\">\n                    <i class=\"ion ion-clipboard mr-1\"></i>\n                    To Do List\n                    </h3>\n\n                    <div class=\"card-tools\">\n                    <ul class=\"pagination pagination-sm\">\n                        <li class=\"page-item\"><a href=\"#\" class=\"page-link\">&laquo;</a></li>\n                        <li class=\"page-item\"><a href=\"#\" class=\"page-link\">1</a></li>\n                        <li class=\"page-item\"><a href=\"#\" class=\"page-link\">2</a></li>\n                        <li class=\"page-item\"><a href=\"#\" class=\"page-link\">3</a></li>\n                        <li class=\"page-item\"><a href=\"#\" class=\"page-link\">&raquo;</a></li>\n                    </ul>\n                    </div>\n                </div>\n                <!-- /.card-header -->\n                <div class=\"card-body\">\n                    <ul class=\"todo-list\" data-widget=\"todo-list\">\n                    <li>\n                        <!-- drag handle -->\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <!-- checkbox -->\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo1\" id=\"todoCheck1\">\n                        <label for=\"todoCheck1\"></label>\n                        </div>\n                        <!-- todo text -->\n                        <span class=\"text\">Design a nice theme</span>\n                        <!-- Emphasis label -->\n                        <small class=\"badge badge-danger\"><i class=\"far fa-clock\"></i> 2 mins</small>\n                        <!-- General tools such as edit or delete-->\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    <li>\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo2\" id=\"todoCheck2\" checked>\n                        <label for=\"todoCheck2\"></label>\n                        </div>\n                        <span class=\"text\">Make the theme responsive</span>\n                        <small class=\"badge badge-info\"><i class=\"far fa-clock\"></i> 4 hours</small>\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    <li>\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo3\" id=\"todoCheck3\">\n                        <label for=\"todoCheck3\"></label>\n                        </div>\n                        <span class=\"text\">Let theme shine like a star</span>\n                        <small class=\"badge badge-warning\"><i class=\"far fa-clock\"></i> 1 day</small>\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    <li>\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo4\" id=\"todoCheck4\">\n                        <label for=\"todoCheck4\"></label>\n                        </div>\n                        <span class=\"text\">Let theme shine like a star</span>\n                        <small class=\"badge badge-success\"><i class=\"far fa-clock\"></i> 3 days</small>\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    <li>\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo5\" id=\"todoCheck5\">\n                        <label for=\"todoCheck5\"></label>\n                        </div>\n                        <span class=\"text\">Check your messages and notifications</span>\n                        <small class=\"badge badge-primary\"><i class=\"far fa-clock\"></i> 1 week</small>\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    <li>\n                        <span class=\"handle\">\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        <i class=\"fas fa-ellipsis-v\"></i>\n                        </span>\n                        <div  class=\"icheck-primary d-inline ml-2\">\n                        <input type=\"checkbox\" value=\"\" name=\"todo6\" id=\"todoCheck6\">\n                        <label for=\"todoCheck6\"></label>\n                        </div>\n                        <span class=\"text\">Let theme shine like a star</span>\n                        <small class=\"badge badge-secondary\"><i class=\"far fa-clock\"></i> 1 month</small>\n                        <div class=\"tools\">\n                        <i class=\"fas fa-edit\"></i>\n                        <i class=\"fas fa-trash-o\"></i>\n                        </div>\n                    </li>\n                    </ul>\n                </div>\n                <!-- /.card-body -->\n                <div class=\"card-footer clearfix\">\n                    <button type=\"button\" class=\"btn btn-info float-right\"><i class=\"fas fa-plus\"></i> Add item</button>\n                </div>\n                </div>\n                <!-- /.card -->\n            </section>\n            <!-- /.Left col -->\n            <!-- right col (We are only adding the ID to make the widgets sortable)-->\n            <section class=\"col-lg-5 connectedSortable\">\n\n                <!-- Map card -->\n                <div class=\"card bg-gradient-primary\">\n                <div class=\"card-header border-0\">\n                    <h3 class=\"card-title\">\n                    <i class=\"fas fa-map-marker-alt mr-1\"></i>\n                    Visitors\n                    </h3>\n                    <!-- card tools -->\n                    <div class=\"card-tools\">\n                    <button type=\"button\" class=\"btn btn-primary btn-sm daterange\" title=\"Date range\">\n                        <i class=\"far fa-calendar-alt\"></i>\n                    </button>\n                    <button type=\"button\" class=\"btn btn-primary btn-sm\" data-card-widget=\"collapse\" title=\"Collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                    </button>\n                    </div>\n                    <!-- /.card-tools -->\n                </div>\n                <div class=\"card-body\">\n                    <div id=\"world-map\" style=\"height: 250px; width: 100%;\"></div>\n                </div>\n                <!-- /.card-body-->\n                <div class=\"card-footer bg-transparent\">\n                    <div class=\"row\">\n                    <div class=\"col-4 text-center\">\n                        <div id=\"sparkline-1\"></div>\n                        <div class=\"text-white\">Visitors</div>\n                    </div>\n                    <!-- ./col -->\n                    <div class=\"col-4 text-center\">\n                        <div id=\"sparkline-2\"></div>\n                        <div class=\"text-white\">Online</div>\n                    </div>\n                    <!-- ./col -->\n                    <div class=\"col-4 text-center\">\n                        <div id=\"sparkline-3\"></div>\n                        <div class=\"text-white\">Sales</div>\n                    </div>\n                    <!-- ./col -->\n                    </div>\n                    <!-- /.row -->\n                </div>\n                </div>\n                <!-- /.card -->\n\n                <!-- solid sales graph -->\n                <div class=\"card bg-gradient-info\">\n                <div class=\"card-header border-0\">\n                    <h3 class=\"card-title\">\n                    <i class=\"fas fa-th mr-1\"></i>\n                    Sales Graph\n                    </h3>\n\n                    <div class=\"card-tools\">\n                    <button type=\"button\" class=\"btn bg-info btn-sm\" data-card-widget=\"collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                    </button>\n                    <button type=\"button\" class=\"btn bg-info btn-sm\" data-card-widget=\"remove\">\n                        <i class=\"fas fa-times\"></i>\n                    </button>\n                    </div>\n                </div>\n                <div class=\"card-body\">\n                    <canvas class=\"chart\" id=\"line-chart\" style=\"min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;\"></canvas>\n                </div>\n                <!-- /.card-body -->\n                <div class=\"card-footer bg-transparent\">\n                    <div class=\"row\">\n                    <div class=\"col-4 text-center\">\n                        <input type=\"text\" class=\"knob\" data-readonly=\"true\" value=\"20\" data-width=\"60\" data-height=\"60\"\n                            data-fgColor=\"#39CCCC\">\n\n                        <div class=\"text-white\">Mail-Orders</div>\n                    </div>\n                    <!-- ./col -->\n                    <div class=\"col-4 text-center\">\n                        <input type=\"text\" class=\"knob\" data-readonly=\"true\" value=\"50\" data-width=\"60\" data-height=\"60\"\n                            data-fgColor=\"#39CCCC\">\n\n                        <div class=\"text-white\">Online</div>\n                    </div>\n                    <!-- ./col -->\n                    <div class=\"col-4 text-center\">\n                        <input type=\"text\" class=\"knob\" data-readonly=\"true\" value=\"30\" data-width=\"60\" data-height=\"60\"\n                            data-fgColor=\"#39CCCC\">\n\n                        <div class=\"text-white\">In-Store</div>\n                    </div>\n                    <!-- ./col -->\n                    </div>\n                    <!-- /.row -->\n                </div>\n                <!-- /.card-footer -->\n                </div>\n                <!-- /.card -->\n\n                <!-- Calendar -->\n                <div class=\"card bg-gradient-success\">\n                <div class=\"card-header border-0\">\n\n                    <h3 class=\"card-title\">\n                    <i class=\"far fa-calendar-alt\"></i>\n                    Calendar\n                    </h3>\n                    <!-- tools card -->\n                    <div class=\"card-tools\">\n                    <!-- button with a dropdown -->\n                    <div class=\"btn-group\">\n                        <button type=\"button\" class=\"btn btn-success btn-sm dropdown-toggle\" data-toggle=\"dropdown\" data-offset=\"-52\">\n                        <i class=\"fas fa-bars\"></i>\n                        </button>\n                        <div class=\"dropdown-menu\" role=\"menu\">\n                        <a href=\"#\" class=\"dropdown-item\">Add new event</a>\n                        <a href=\"#\" class=\"dropdown-item\">Clear events</a>\n                        <div class=\"dropdown-divider\"></div>\n                        <a href=\"#\" class=\"dropdown-item\">View calendar</a>\n                        </div>\n                    </div>\n                    <button type=\"button\" class=\"btn btn-success btn-sm\" data-card-widget=\"collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                    </button>\n                    <button type=\"button\" class=\"btn btn-success btn-sm\" data-card-widget=\"remove\">\n                        <i class=\"fas fa-times\"></i>\n                    </button>\n                    </div>\n                    <!-- /. tools -->\n                </div>\n                <!-- /.card-header -->\n                <div class=\"card-body pt-0\">\n                    <!--The calendar -->\n                    <div id=\"calendar\" style=\"width: 100%\"></div>\n                </div>\n                <!-- /.card-body -->\n                </div>\n                <!-- /.card -->\n            </section>\n            <!-- right col -->\n            </div>\n            <!-- /.row (main row) -->\n        </div><!-- /.container-fluid -->\n    </section>\n    <!-- /.content -->\n</div>\n";
    /***/
  },

  /***/
  "./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index2/template-index2.component.html":
  /*!*************************************************************************************************************!*\
    !*** ./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index2/template-index2.component.html ***!
    \*************************************************************************************************************/

  /*! exports provided: default */

  /***/
  function node_modulesRawLoaderDistCjsJsSrcAppCommonTemplateIndex2TemplateIndex2ComponentHtml(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "<div class=\"content-wrapper\">\n    <!-- Content Header (Page header) -->\n    <div class=\"content-header\">\n      <div class=\"container-fluid\">\n        <div class=\"row mb-2\">\n          <div class=\"col-sm-6\">\n            <h1 class=\"m-0 text-dark\">Dashboard v2</h1>\n          </div><!-- /.col -->\n          <div class=\"col-sm-6\">\n            <ol class=\"breadcrumb float-sm-right\">\n              <li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>\n              <li class=\"breadcrumb-item active\">Dashboard v2</li>\n            </ol>\n          </div><!-- /.col -->\n        </div><!-- /.row -->\n      </div><!-- /.container-fluid -->\n    </div>\n    <!-- /.content-header -->\n\n    <!-- Main content -->\n    <section class=\"content\">\n      <div class=\"container-fluid\">\n        <!-- Info boxes -->\n        <div class=\"row\">\n          <div class=\"col-12 col-sm-6 col-md-3\">\n            <div class=\"info-box\">\n              <span class=\"info-box-icon bg-info elevation-1\"><i class=\"fas fa-cog\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">CPU Traffic</span>\n                <span class=\"info-box-number\">\n                  10\n                  <small>%</small>\n                </span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n          </div>\n          <!-- /.col -->\n          <div class=\"col-12 col-sm-6 col-md-3\">\n            <div class=\"info-box mb-3\">\n              <span class=\"info-box-icon bg-danger elevation-1\"><i class=\"fas fa-thumbs-up\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Likes</span>\n                <span class=\"info-box-number\">41,410</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n          </div>\n          <!-- /.col -->\n\n          <!-- fix for small devices only -->\n          <div class=\"clearfix hidden-md-up\"></div>\n\n          <div class=\"col-12 col-sm-6 col-md-3\">\n            <div class=\"info-box mb-3\">\n              <span class=\"info-box-icon bg-success elevation-1\"><i class=\"fas fa-shopping-cart\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Sales</span>\n                <span class=\"info-box-number\">760</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n          </div>\n          <!-- /.col -->\n          <div class=\"col-12 col-sm-6 col-md-3\">\n            <div class=\"info-box mb-3\">\n              <span class=\"info-box-icon bg-warning elevation-1\"><i class=\"fas fa-users\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">New Members</span>\n                <span class=\"info-box-number\">2,000</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n          </div>\n          <!-- /.col -->\n        </div>\n        <!-- /.row -->\n\n        <div class=\"row\">\n          <div class=\"col-md-12\">\n            <div class=\"card\">\n              <div class=\"card-header\">\n                <h5 class=\"card-title\">Monthly Recap Report</h5>\n\n                <div class=\"card-tools\">\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                    <i class=\"fas fa-minus\"></i>\n                  </button>\n                  <div class=\"btn-group\">\n                    <button type=\"button\" class=\"btn btn-tool dropdown-toggle\" data-toggle=\"dropdown\">\n                      <i class=\"fas fa-wrench\"></i>\n                    </button>\n                    <div class=\"dropdown-menu dropdown-menu-right\" role=\"menu\">\n                      <a href=\"#\" class=\"dropdown-item\">Action</a>\n                      <a href=\"#\" class=\"dropdown-item\">Another action</a>\n                      <a href=\"#\" class=\"dropdown-item\">Something else here</a>\n                      <a class=\"dropdown-divider\"></a>\n                      <a href=\"#\" class=\"dropdown-item\">Separated link</a>\n                    </div>\n                  </div>\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                    <i class=\"fas fa-times\"></i>\n                  </button>\n                </div>\n              </div>\n              <!-- /.card-header -->\n              <div class=\"card-body\">\n                <div class=\"row\">\n                  <div class=\"col-md-8\">\n                    <p class=\"text-center\">\n                      <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>\n                    </p>\n\n                    <div class=\"chart\">\n                      <!-- Sales Chart Canvas -->\n                      <canvas id=\"salesChart\" height=\"180\" style=\"height: 180px;\"></canvas>\n                    </div>\n                    <!-- /.chart-responsive -->\n                  </div>\n                  <!-- /.col -->\n                  <div class=\"col-md-4\">\n                    <p class=\"text-center\">\n                      <strong>Goal Completion</strong>\n                    </p>\n\n                    <div class=\"progress-group\">\n                      Add Products to Cart\n                      <span class=\"float-right\"><b>160</b>/200</span>\n                      <div class=\"progress progress-sm\">\n                        <div class=\"progress-bar bg-primary\" style=\"width: 80%\"></div>\n                      </div>\n                    </div>\n                    <!-- /.progress-group -->\n\n                    <div class=\"progress-group\">\n                      Complete Purchase\n                      <span class=\"float-right\"><b>310</b>/400</span>\n                      <div class=\"progress progress-sm\">\n                        <div class=\"progress-bar bg-danger\" style=\"width: 75%\"></div>\n                      </div>\n                    </div>\n\n                    <!-- /.progress-group -->\n                    <div class=\"progress-group\">\n                      <span class=\"progress-text\">Visit Premium Page</span>\n                      <span class=\"float-right\"><b>480</b>/800</span>\n                      <div class=\"progress progress-sm\">\n                        <div class=\"progress-bar bg-success\" style=\"width: 60%\"></div>\n                      </div>\n                    </div>\n\n                    <!-- /.progress-group -->\n                    <div class=\"progress-group\">\n                      Send Inquiries\n                      <span class=\"float-right\"><b>250</b>/500</span>\n                      <div class=\"progress progress-sm\">\n                        <div class=\"progress-bar bg-warning\" style=\"width: 50%\"></div>\n                      </div>\n                    </div>\n                    <!-- /.progress-group -->\n                  </div>\n                  <!-- /.col -->\n                </div>\n                <!-- /.row -->\n              </div>\n              <!-- ./card-body -->\n              <div class=\"card-footer\">\n                <div class=\"row\">\n                  <div class=\"col-sm-3 col-6\">\n                    <div class=\"description-block border-right\">\n                      <span class=\"description-percentage text-success\"><i class=\"fas fa-caret-up\"></i> 17%</span>\n                      <h5 class=\"description-header\">$35,210.43</h5>\n                      <span class=\"description-text\">TOTAL REVENUE</span>\n                    </div>\n                    <!-- /.description-block -->\n                  </div>\n                  <!-- /.col -->\n                  <div class=\"col-sm-3 col-6\">\n                    <div class=\"description-block border-right\">\n                      <span class=\"description-percentage text-warning\"><i class=\"fas fa-caret-left\"></i> 0%</span>\n                      <h5 class=\"description-header\">$10,390.90</h5>\n                      <span class=\"description-text\">TOTAL COST</span>\n                    </div>\n                    <!-- /.description-block -->\n                  </div>\n                  <!-- /.col -->\n                  <div class=\"col-sm-3 col-6\">\n                    <div class=\"description-block border-right\">\n                      <span class=\"description-percentage text-success\"><i class=\"fas fa-caret-up\"></i> 20%</span>\n                      <h5 class=\"description-header\">$24,813.53</h5>\n                      <span class=\"description-text\">TOTAL PROFIT</span>\n                    </div>\n                    <!-- /.description-block -->\n                  </div>\n                  <!-- /.col -->\n                  <div class=\"col-sm-3 col-6\">\n                    <div class=\"description-block\">\n                      <span class=\"description-percentage text-danger\"><i class=\"fas fa-caret-down\"></i> 18%</span>\n                      <h5 class=\"description-header\">1200</h5>\n                      <span class=\"description-text\">GOAL COMPLETIONS</span>\n                    </div>\n                    <!-- /.description-block -->\n                  </div>\n                </div>\n                <!-- /.row -->\n              </div>\n              <!-- /.card-footer -->\n            </div>\n            <!-- /.card -->\n          </div>\n          <!-- /.col -->\n        </div>\n        <!-- /.row -->\n\n        <!-- Main row -->\n        <div class=\"row\">\n          <!-- Left col -->\n          <div class=\"col-md-8\">\n            <!-- MAP & BOX PANE -->\n            <div class=\"card\">\n              <div class=\"card-header\">\n                <h3 class=\"card-title\">US-Visitors Report</h3>\n\n                <div class=\"card-tools\">\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                    <i class=\"fas fa-minus\"></i>\n                  </button>\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                    <i class=\"fas fa-times\"></i>\n                  </button>\n                </div>\n              </div>\n              <!-- /.card-header -->\n              <div class=\"card-body p-0\">\n                <div class=\"d-md-flex\">\n                  <div class=\"p-1 flex-fill\" style=\"overflow: hidden\">\n                    <!-- Map will be created here -->\n                    <div id=\"world-map-markers\" style=\"height: 325px; overflow: hidden\">\n                      <div class=\"map\"></div>\n                    </div>\n                  </div>\n                  <div class=\"card-pane-right bg-success pt-2 pb-2 pl-4 pr-4\">\n                    <div class=\"description-block mb-4\">\n                      <div class=\"sparkbar pad\" data-color=\"#fff\">90,70,90,70,75,80,70</div>\n                      <h5 class=\"description-header\">8390</h5>\n                      <span class=\"description-text\">Visits</span>\n                    </div>\n                    <!-- /.description-block -->\n                    <div class=\"description-block mb-4\">\n                      <div class=\"sparkbar pad\" data-color=\"#fff\">90,50,90,70,61,83,63</div>\n                      <h5 class=\"description-header\">30%</h5>\n                      <span class=\"description-text\">Referrals</span>\n                    </div>\n                    <!-- /.description-block -->\n                    <div class=\"description-block\">\n                      <div class=\"sparkbar pad\" data-color=\"#fff\">90,50,90,70,61,83,63</div>\n                      <h5 class=\"description-header\">70%</h5>\n                      <span class=\"description-text\">Organic</span>\n                    </div>\n                    <!-- /.description-block -->\n                  </div><!-- /.card-pane-right -->\n                </div><!-- /.d-md-flex -->\n              </div>\n              <!-- /.card-body -->\n            </div>\n            <!-- /.card -->\n            <div class=\"row\">\n              <div class=\"col-md-6\">\n                <!-- DIRECT CHAT -->\n                <div class=\"card direct-chat direct-chat-warning\">\n                  <div class=\"card-header\">\n                    <h3 class=\"card-title\">Direct Chat</h3>\n\n                    <div class=\"card-tools\">\n                      <span title=\"3 New Messages\" class=\"badge badge-warning\">3</span>\n                      <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                      </button>\n                      <button type=\"button\" class=\"btn btn-tool\" title=\"Contacts\" data-widget=\"chat-pane-toggle\">\n                        <i class=\"fas fa-comments\"></i>\n                      </button>\n                      <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                        <i class=\"fas fa-times\"></i>\n                      </button>\n                    </div>\n                  </div>\n                  <!-- /.card-header -->\n                  <div class=\"card-body\">\n                    <!-- Conversations are loaded here -->\n                    <div class=\"direct-chat-messages\">\n                      <!-- Message. Default to the left -->\n                      <div class=\"direct-chat-msg\">\n                        <div class=\"direct-chat-infos clearfix\">\n                          <span class=\"direct-chat-name float-left\">Alexander Pierce</span>\n                          <span class=\"direct-chat-timestamp float-right\">23 Jan 2:00 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                          Is this template really for free? That's unbelievable!\n                        </div>\n                        <!-- /.direct-chat-text -->\n                      </div>\n                      <!-- /.direct-chat-msg -->\n\n                      <!-- Message to the right -->\n                      <div class=\"direct-chat-msg right\">\n                        <div class=\"direct-chat-infos clearfix\">\n                          <span class=\"direct-chat-name float-right\">Sarah Bullock</span>\n                          <span class=\"direct-chat-timestamp float-left\">23 Jan 2:05 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                          You better believe it!\n                        </div>\n                        <!-- /.direct-chat-text -->\n                      </div>\n                      <!-- /.direct-chat-msg -->\n\n                      <!-- Message. Default to the left -->\n                      <div class=\"direct-chat-msg\">\n                        <div class=\"direct-chat-infos clearfix\">\n                          <span class=\"direct-chat-name float-left\">Alexander Pierce</span>\n                          <span class=\"direct-chat-timestamp float-right\">23 Jan 5:37 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                          Working with AdminLTE on a great new app! Wanna join?\n                        </div>\n                        <!-- /.direct-chat-text -->\n                      </div>\n                      <!-- /.direct-chat-msg -->\n\n                      <!-- Message to the right -->\n                      <div class=\"direct-chat-msg right\">\n                        <div class=\"direct-chat-infos clearfix\">\n                          <span class=\"direct-chat-name float-right\">Sarah Bullock</span>\n                          <span class=\"direct-chat-timestamp float-left\">23 Jan 6:10 pm</span>\n                        </div>\n                        <!-- /.direct-chat-infos -->\n                        <img class=\"direct-chat-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"message user image\">\n                        <!-- /.direct-chat-img -->\n                        <div class=\"direct-chat-text\">\n                          I would love to.\n                        </div>\n                        <!-- /.direct-chat-text -->\n                      </div>\n                      <!-- /.direct-chat-msg -->\n\n                    </div>\n                    <!--/.direct-chat-messages-->\n\n                    <!-- Contacts are loaded here -->\n                    <div class=\"direct-chat-contacts\">\n                      <ul class=\"contacts-list\">\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                Count Dracula\n                                <small class=\"contacts-list-date float-right\">2/28/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">How have you been? I was...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user7-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                Sarah Doe\n                                <small class=\"contacts-list-date float-right\">2/23/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">I will be waiting for...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                Nadia Jolie\n                                <small class=\"contacts-list-date float-right\">2/20/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">I'll call you back at...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user5-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                Nora S. Vans\n                                <small class=\"contacts-list-date float-right\">2/10/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">Where is your new...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user6-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                John K.\n                                <small class=\"contacts-list-date float-right\">1/27/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">Can I take a look at...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                        <li>\n                          <a href=\"#\">\n                            <img class=\"contacts-list-img\" src=\"./assets/dist/img/user8-128x128.jpg\" alt=\"User Avatar\">\n\n                            <div class=\"contacts-list-info\">\n                              <span class=\"contacts-list-name\">\n                                Kenneth M.\n                                <small class=\"contacts-list-date float-right\">1/4/2015</small>\n                              </span>\n                              <span class=\"contacts-list-msg\">Never mind I found...</span>\n                            </div>\n                            <!-- /.contacts-list-info -->\n                          </a>\n                        </li>\n                        <!-- End Contact Item -->\n                      </ul>\n                      <!-- /.contacts-list -->\n                    </div>\n                    <!-- /.direct-chat-pane -->\n                  </div>\n                  <!-- /.card-body -->\n                  <div class=\"card-footer\">\n                    <form action=\"#\" method=\"post\">\n                      <div class=\"input-group\">\n                        <input type=\"text\" name=\"message\" placeholder=\"Type Message ...\" class=\"form-control\">\n                        <span class=\"input-group-append\">\n                          <button type=\"button\" class=\"btn btn-warning\">Send</button>\n                        </span>\n                      </div>\n                    </form>\n                  </div>\n                  <!-- /.card-footer-->\n                </div>\n                <!--/.direct-chat -->\n              </div>\n              <!-- /.col -->\n\n              <div class=\"col-md-6\">\n                <!-- USERS LIST -->\n                <div class=\"card\">\n                  <div class=\"card-header\">\n                    <h3 class=\"card-title\">Latest Members</h3>\n\n                    <div class=\"card-tools\">\n                      <span class=\"badge badge-danger\">8 New Members</span>\n                      <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                        <i class=\"fas fa-minus\"></i>\n                      </button>\n                      <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                        <i class=\"fas fa-times\"></i>\n                      </button>\n                    </div>\n                  </div>\n                  <!-- /.card-header -->\n                  <div class=\"card-body p-0\">\n                    <ul class=\"users-list clearfix\">\n                      <li>\n                        <img src=\"./assets/dist/img/user1-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Alexander Pierce</a>\n                        <span class=\"users-list-date\">Today</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user8-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Norman</a>\n                        <span class=\"users-list-date\">Yesterday</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user7-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Jane</a>\n                        <span class=\"users-list-date\">12 Jan</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user6-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">John</a>\n                        <span class=\"users-list-date\">12 Jan</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user2-160x160.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Alexander</a>\n                        <span class=\"users-list-date\">13 Jan</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user5-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Sarah</a>\n                        <span class=\"users-list-date\">14 Jan</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user4-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Nora</a>\n                        <span class=\"users-list-date\">15 Jan</span>\n                      </li>\n                      <li>\n                        <img src=\"./assets/dist/img/user3-128x128.jpg\" alt=\"User Image\">\n                        <a class=\"users-list-name\" href=\"#\">Nadia</a>\n                        <span class=\"users-list-date\">15 Jan</span>\n                      </li>\n                    </ul>\n                    <!-- /.users-list -->\n                  </div>\n                  <!-- /.card-body -->\n                  <div class=\"card-footer text-center\">\n                    <a href=\"javascript:\">View All Users</a>\n                  </div>\n                  <!-- /.card-footer -->\n                </div>\n                <!--/.card -->\n              </div>\n              <!-- /.col -->\n            </div>\n            <!-- /.row -->\n\n            <!-- TABLE: LATEST ORDERS -->\n            <div class=\"card\">\n              <div class=\"card-header border-transparent\">\n                <h3 class=\"card-title\">Latest Orders</h3>\n\n                <div class=\"card-tools\">\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                    <i class=\"fas fa-minus\"></i>\n                  </button>\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                    <i class=\"fas fa-times\"></i>\n                  </button>\n                </div>\n              </div>\n              <!-- /.card-header -->\n              <div class=\"card-body p-0\">\n                <div class=\"table-responsive\">\n                  <table class=\"table m-0\">\n                    <thead>\n                    <tr>\n                      <th>Order ID</th>\n                      <th>Item</th>\n                      <th>Status</th>\n                      <th>Popularity</th>\n                    </tr>\n                    </thead>\n                    <tbody>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR9842</a></td>\n                      <td>Call of Duty IV</td>\n                      <td><span class=\"badge badge-success\">Shipped</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">90,80,90,-70,61,-83,63</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR1848</a></td>\n                      <td>Samsung Smart TV</td>\n                      <td><span class=\"badge badge-warning\">Pending</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#f39c12\" data-height=\"20\">90,80,-90,70,61,-83,68</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR7429</a></td>\n                      <td>iPhone 6 Plus</td>\n                      <td><span class=\"badge badge-danger\">Delivered</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#f56954\" data-height=\"20\">90,-80,90,70,-61,83,63</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR7429</a></td>\n                      <td>Samsung Smart TV</td>\n                      <td><span class=\"badge badge-info\">Processing</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#00c0ef\" data-height=\"20\">90,80,-90,70,-61,83,63</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR1848</a></td>\n                      <td>Samsung Smart TV</td>\n                      <td><span class=\"badge badge-warning\">Pending</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#f39c12\" data-height=\"20\">90,80,-90,70,61,-83,68</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR7429</a></td>\n                      <td>iPhone 6 Plus</td>\n                      <td><span class=\"badge badge-danger\">Delivered</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#f56954\" data-height=\"20\">90,-80,90,70,-61,83,63</div>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td><a href=\"pages/examples/invoice.html\">OR9842</a></td>\n                      <td>Call of Duty IV</td>\n                      <td><span class=\"badge badge-success\">Shipped</span></td>\n                      <td>\n                        <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">90,80,90,-70,61,-83,63</div>\n                      </td>\n                    </tr>\n                    </tbody>\n                  </table>\n                </div>\n                <!-- /.table-responsive -->\n              </div>\n              <!-- /.card-body -->\n              <div class=\"card-footer clearfix\">\n                <a href=\"javascript:void(0)\" class=\"btn btn-sm btn-info float-left\">Place New Order</a>\n                <a href=\"javascript:void(0)\" class=\"btn btn-sm btn-secondary float-right\">View All Orders</a>\n              </div>\n              <!-- /.card-footer -->\n            </div>\n            <!-- /.card -->\n          </div>\n          <!-- /.col -->\n\n          <div class=\"col-md-4\">\n            <!-- Info Boxes Style 2 -->\n            <div class=\"info-box mb-3 bg-warning\">\n              <span class=\"info-box-icon\"><i class=\"fas fa-tag\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Inventory</span>\n                <span class=\"info-box-number\">5,200</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n            <div class=\"info-box mb-3 bg-success\">\n              <span class=\"info-box-icon\"><i class=\"far fa-heart\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Mentions</span>\n                <span class=\"info-box-number\">92,050</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n            <div class=\"info-box mb-3 bg-danger\">\n              <span class=\"info-box-icon\"><i class=\"fas fa-cloud-download-alt\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Downloads</span>\n                <span class=\"info-box-number\">114,381</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n            <div class=\"info-box mb-3 bg-info\">\n              <span class=\"info-box-icon\"><i class=\"far fa-comment\"></i></span>\n\n              <div class=\"info-box-content\">\n                <span class=\"info-box-text\">Direct Messages</span>\n                <span class=\"info-box-number\">163,921</span>\n              </div>\n              <!-- /.info-box-content -->\n            </div>\n            <!-- /.info-box -->\n\n            <div class=\"card\">\n              <div class=\"card-header\">\n                <h3 class=\"card-title\">Browser Usage</h3>\n\n                <div class=\"card-tools\">\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                    <i class=\"fas fa-minus\"></i>\n                  </button>\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                    <i class=\"fas fa-times\"></i>\n                  </button>\n                </div>\n              </div>\n              <!-- /.card-header -->\n              <div class=\"card-body\">\n                <div class=\"row\">\n                  <div class=\"col-md-8\">\n                    <div class=\"chart-responsive\">\n                      <canvas id=\"pieChart\" height=\"150\"></canvas>\n                    </div>\n                    <!-- ./chart-responsive -->\n                  </div>\n                  <!-- /.col -->\n                  <div class=\"col-md-4\">\n                    <ul class=\"chart-legend clearfix\">\n                      <li><i class=\"far fa-circle text-danger\"></i> Chrome</li>\n                      <li><i class=\"far fa-circle text-success\"></i> IE</li>\n                      <li><i class=\"far fa-circle text-warning\"></i> FireFox</li>\n                      <li><i class=\"far fa-circle text-info\"></i> Safari</li>\n                      <li><i class=\"far fa-circle text-primary\"></i> Opera</li>\n                      <li><i class=\"far fa-circle text-secondary\"></i> Navigator</li>\n                    </ul>\n                  </div>\n                  <!-- /.col -->\n                </div>\n                <!-- /.row -->\n              </div>\n              <!-- /.card-body -->\n              <div class=\"card-footer bg-white p-0\">\n                <ul class=\"nav nav-pills flex-column\">\n                  <li class=\"nav-item\">\n                    <a href=\"#\" class=\"nav-link\">\n                      United States of America\n                      <span class=\"float-right text-danger\">\n                        <i class=\"fas fa-arrow-down text-sm\"></i>\n                        12%</span>\n                    </a>\n                  </li>\n                  <li class=\"nav-item\">\n                    <a href=\"#\" class=\"nav-link\">\n                      India\n                      <span class=\"float-right text-success\">\n                        <i class=\"fas fa-arrow-up text-sm\"></i> 4%\n                      </span>\n                    </a>\n                  </li>\n                  <li class=\"nav-item\">\n                    <a href=\"#\" class=\"nav-link\">\n                      China\n                      <span class=\"float-right text-warning\">\n                        <i class=\"fas fa-arrow-left text-sm\"></i> 0%\n                      </span>\n                    </a>\n                  </li>\n                </ul>\n              </div>\n              <!-- /.footer -->\n            </div>\n            <!-- /.card -->\n\n            <!-- PRODUCT LIST -->\n            <div class=\"card\">\n              <div class=\"card-header\">\n                <h3 class=\"card-title\">Recently Added Products</h3>\n\n                <div class=\"card-tools\">\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"collapse\">\n                    <i class=\"fas fa-minus\"></i>\n                  </button>\n                  <button type=\"button\" class=\"btn btn-tool\" data-card-widget=\"remove\">\n                    <i class=\"fas fa-times\"></i>\n                  </button>\n                </div>\n              </div>\n              <!-- /.card-header -->\n              <div class=\"card-body p-0\">\n                <ul class=\"products-list product-list-in-card pl-2 pr-2\">\n                  <li class=\"item\">\n                    <div class=\"product-img\">\n                      <img src=\"./assets/dist/img/default-150x150.png\" alt=\"Product Image\" class=\"img-size-50\">\n                    </div>\n                    <div class=\"product-info\">\n                      <a href=\"javascript:void(0)\" class=\"product-title\">Samsung TV\n                        <span class=\"badge badge-warning float-right\">$1800</span></a>\n                      <span class=\"product-description\">\n                        Samsung 32\" 1080p 60Hz LED Smart HDTV.\n                      </span>\n                    </div>\n                  </li>\n                  <!-- /.item -->\n                  <li class=\"item\">\n                    <div class=\"product-img\">\n                      <img src=\"./assets/dist/img/default-150x150.png\" alt=\"Product Image\" class=\"img-size-50\">\n                    </div>\n                    <div class=\"product-info\">\n                      <a href=\"javascript:void(0)\" class=\"product-title\">Bicycle\n                        <span class=\"badge badge-info float-right\">$700</span></a>\n                      <span class=\"product-description\">\n                        26\" Mongoose Dolomite Men's 7-speed, Navy Blue.\n                      </span>\n                    </div>\n                  </li>\n                  <!-- /.item -->\n                  <li class=\"item\">\n                    <div class=\"product-img\">\n                      <img src=\"./assets/dist/img/default-150x150.png\" alt=\"Product Image\" class=\"img-size-50\">\n                    </div>\n                    <div class=\"product-info\">\n                      <a href=\"javascript:void(0)\" class=\"product-title\">\n                        Xbox One <span class=\"badge badge-danger float-right\">\n                        $350\n                      </span>\n                      </a>\n                      <span class=\"product-description\">\n                        Xbox One Console Bundle with Halo Master Chief Collection.\n                      </span>\n                    </div>\n                  </li>\n                  <!-- /.item -->\n                  <li class=\"item\">\n                    <div class=\"product-img\">\n                      <img src=\"./assets/dist/img/default-150x150.png\" alt=\"Product Image\" class=\"img-size-50\">\n                    </div>\n                    <div class=\"product-info\">\n                      <a href=\"javascript:void(0)\" class=\"product-title\">PlayStation 4\n                        <span class=\"badge badge-success float-right\">$399</span></a>\n                      <span class=\"product-description\">\n                        PlayStation 4 500GB Console (PS4)\n                      </span>\n                    </div>\n                  </li>\n                  <!-- /.item -->\n                </ul>\n              </div>\n              <!-- /.card-body -->\n              <div class=\"card-footer text-center\">\n                <a href=\"javascript:void(0)\" class=\"uppercase\">View All Products</a>\n              </div>\n              <!-- /.card-footer -->\n            </div>\n            <!-- /.card -->\n          </div>\n          <!-- /.col -->\n        </div>\n        <!-- /.row -->\n      </div><!--/. container-fluid -->\n    </section>\n    <!-- /.content -->\n  </div>\n";
    /***/
  },

  /***/
  "./node_modules/tslib/tslib.es6.js":
  /*!*****************************************!*\
    !*** ./node_modules/tslib/tslib.es6.js ***!
    \*****************************************/

  /*! exports provided: __extends, __assign, __rest, __decorate, __param, __metadata, __awaiter, __generator, __createBinding, __exportStar, __values, __read, __spread, __spreadArrays, __await, __asyncGenerator, __asyncDelegator, __asyncValues, __makeTemplateObject, __importStar, __importDefault, __classPrivateFieldGet, __classPrivateFieldSet */

  /***/
  function node_modulesTslibTslibEs6Js(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__extends", function () {
      return __extends;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__assign", function () {
      return _assign;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__rest", function () {
      return __rest;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__decorate", function () {
      return __decorate;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__param", function () {
      return __param;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__metadata", function () {
      return __metadata;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__awaiter", function () {
      return __awaiter;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__generator", function () {
      return __generator;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__createBinding", function () {
      return __createBinding;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__exportStar", function () {
      return __exportStar;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__values", function () {
      return __values;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__read", function () {
      return __read;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__spread", function () {
      return __spread;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__spreadArrays", function () {
      return __spreadArrays;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__await", function () {
      return __await;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__asyncGenerator", function () {
      return __asyncGenerator;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__asyncDelegator", function () {
      return __asyncDelegator;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__asyncValues", function () {
      return __asyncValues;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__makeTemplateObject", function () {
      return __makeTemplateObject;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__importStar", function () {
      return __importStar;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__importDefault", function () {
      return __importDefault;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__classPrivateFieldGet", function () {
      return __classPrivateFieldGet;
    });
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "__classPrivateFieldSet", function () {
      return __classPrivateFieldSet;
    });
    /*! *****************************************************************************
    Copyright (c) Microsoft Corporation.
    
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted.
    
    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
    AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
    LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
    OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
    PERFORMANCE OF THIS SOFTWARE.
    ***************************************************************************** */

    /* global Reflect, Promise */


    var _extendStatics = function extendStatics(d, b) {
      _extendStatics = Object.setPrototypeOf || {
        __proto__: []
      } instanceof Array && function (d, b) {
        d.__proto__ = b;
      } || function (d, b) {
        for (var p in b) {
          if (b.hasOwnProperty(p)) d[p] = b[p];
        }
      };

      return _extendStatics(d, b);
    };

    function __extends(d, b) {
      _extendStatics(d, b);

      function __() {
        this.constructor = d;
      }

      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    }

    var _assign = function __assign() {
      _assign = Object.assign || function __assign(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
          s = arguments[i];

          for (var p in s) {
            if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
          }
        }

        return t;
      };

      return _assign.apply(this, arguments);
    };

    function __rest(s, e) {
      var t = {};

      for (var p in s) {
        if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0) t[p] = s[p];
      }

      if (s != null && typeof Object.getOwnPropertySymbols === "function") for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
        if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i])) t[p[i]] = s[p[i]];
      }
      return t;
    }

    function __decorate(decorators, target, key, desc) {
      var c = arguments.length,
          r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc,
          d;
      if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);else for (var i = decorators.length - 1; i >= 0; i--) {
        if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
      }
      return c > 3 && r && Object.defineProperty(target, key, r), r;
    }

    function __param(paramIndex, decorator) {
      return function (target, key) {
        decorator(target, key, paramIndex);
      };
    }

    function __metadata(metadataKey, metadataValue) {
      if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(metadataKey, metadataValue);
    }

    function __awaiter(thisArg, _arguments, P, generator) {
      function adopt(value) {
        return value instanceof P ? value : new P(function (resolve) {
          resolve(value);
        });
      }

      return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) {
          try {
            step(generator.next(value));
          } catch (e) {
            reject(e);
          }
        }

        function rejected(value) {
          try {
            step(generator["throw"](value));
          } catch (e) {
            reject(e);
          }
        }

        function step(result) {
          result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected);
        }

        step((generator = generator.apply(thisArg, _arguments || [])).next());
      });
    }

    function __generator(thisArg, body) {
      var _ = {
        label: 0,
        sent: function sent() {
          if (t[0] & 1) throw t[1];
          return t[1];
        },
        trys: [],
        ops: []
      },
          f,
          y,
          t,
          g;
      return g = {
        next: verb(0),
        "throw": verb(1),
        "return": verb(2)
      }, typeof Symbol === "function" && (g[Symbol.iterator] = function () {
        return this;
      }), g;

      function verb(n) {
        return function (v) {
          return step([n, v]);
        };
      }

      function step(op) {
        if (f) throw new TypeError("Generator is already executing.");

        while (_) {
          try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];

            switch (op[0]) {
              case 0:
              case 1:
                t = op;
                break;

              case 4:
                _.label++;
                return {
                  value: op[1],
                  done: false
                };

              case 5:
                _.label++;
                y = op[1];
                op = [0];
                continue;

              case 7:
                op = _.ops.pop();

                _.trys.pop();

                continue;

              default:
                if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) {
                  _ = 0;
                  continue;
                }

                if (op[0] === 3 && (!t || op[1] > t[0] && op[1] < t[3])) {
                  _.label = op[1];
                  break;
                }

                if (op[0] === 6 && _.label < t[1]) {
                  _.label = t[1];
                  t = op;
                  break;
                }

                if (t && _.label < t[2]) {
                  _.label = t[2];

                  _.ops.push(op);

                  break;
                }

                if (t[2]) _.ops.pop();

                _.trys.pop();

                continue;
            }

            op = body.call(thisArg, _);
          } catch (e) {
            op = [6, e];
            y = 0;
          } finally {
            f = t = 0;
          }
        }

        if (op[0] & 5) throw op[1];
        return {
          value: op[0] ? op[1] : void 0,
          done: true
        };
      }
    }

    function __createBinding(o, m, k, k2) {
      if (k2 === undefined) k2 = k;
      o[k2] = m[k];
    }

    function __exportStar(m, exports) {
      for (var p in m) {
        if (p !== "default" && !exports.hasOwnProperty(p)) exports[p] = m[p];
      }
    }

    function __values(o) {
      var s = typeof Symbol === "function" && Symbol.iterator,
          m = s && o[s],
          i = 0;
      if (m) return m.call(o);
      if (o && typeof o.length === "number") return {
        next: function next() {
          if (o && i >= o.length) o = void 0;
          return {
            value: o && o[i++],
            done: !o
          };
        }
      };
      throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
    }

    function __read(o, n) {
      var m = typeof Symbol === "function" && o[Symbol.iterator];
      if (!m) return o;
      var i = m.call(o),
          r,
          ar = [],
          e;

      try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) {
          ar.push(r.value);
        }
      } catch (error) {
        e = {
          error: error
        };
      } finally {
        try {
          if (r && !r.done && (m = i["return"])) m.call(i);
        } finally {
          if (e) throw e.error;
        }
      }

      return ar;
    }

    function __spread() {
      for (var ar = [], i = 0; i < arguments.length; i++) {
        ar = ar.concat(__read(arguments[i]));
      }

      return ar;
    }

    function __spreadArrays() {
      for (var s = 0, i = 0, il = arguments.length; i < il; i++) {
        s += arguments[i].length;
      }

      for (var r = Array(s), k = 0, i = 0; i < il; i++) {
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++) {
          r[k] = a[j];
        }
      }

      return r;
    }

    ;

    function __await(v) {
      return this instanceof __await ? (this.v = v, this) : new __await(v);
    }

    function __asyncGenerator(thisArg, _arguments, generator) {
      if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
      var g = generator.apply(thisArg, _arguments || []),
          i,
          q = [];
      return i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () {
        return this;
      }, i;

      function verb(n) {
        if (g[n]) i[n] = function (v) {
          return new Promise(function (a, b) {
            q.push([n, v, a, b]) > 1 || resume(n, v);
          });
        };
      }

      function resume(n, v) {
        try {
          step(g[n](v));
        } catch (e) {
          settle(q[0][3], e);
        }
      }

      function step(r) {
        r.value instanceof __await ? Promise.resolve(r.value.v).then(fulfill, reject) : settle(q[0][2], r);
      }

      function fulfill(value) {
        resume("next", value);
      }

      function reject(value) {
        resume("throw", value);
      }

      function settle(f, v) {
        if (f(v), q.shift(), q.length) resume(q[0][0], q[0][1]);
      }
    }

    function __asyncDelegator(o) {
      var i, p;
      return i = {}, verb("next"), verb("throw", function (e) {
        throw e;
      }), verb("return"), i[Symbol.iterator] = function () {
        return this;
      }, i;

      function verb(n, f) {
        i[n] = o[n] ? function (v) {
          return (p = !p) ? {
            value: __await(o[n](v)),
            done: n === "return"
          } : f ? f(v) : v;
        } : f;
      }
    }

    function __asyncValues(o) {
      if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
      var m = o[Symbol.asyncIterator],
          i;
      return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () {
        return this;
      }, i);

      function verb(n) {
        i[n] = o[n] && function (v) {
          return new Promise(function (resolve, reject) {
            v = o[n](v), settle(resolve, reject, v.done, v.value);
          });
        };
      }

      function settle(resolve, reject, d, v) {
        Promise.resolve(v).then(function (v) {
          resolve({
            value: v,
            done: d
          });
        }, reject);
      }
    }

    function __makeTemplateObject(cooked, raw) {
      if (Object.defineProperty) {
        Object.defineProperty(cooked, "raw", {
          value: raw
        });
      } else {
        cooked.raw = raw;
      }

      return cooked;
    }

    ;

    function __importStar(mod) {
      if (mod && mod.__esModule) return mod;
      var result = {};
      if (mod != null) for (var k in mod) {
        if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
      }
      result["default"] = mod;
      return result;
    }

    function __importDefault(mod) {
      return mod && mod.__esModule ? mod : {
        "default": mod
      };
    }

    function __classPrivateFieldGet(receiver, privateMap) {
      if (!privateMap.has(receiver)) {
        throw new TypeError("attempted to get private field on non-instance");
      }

      return privateMap.get(receiver);
    }

    function __classPrivateFieldSet(receiver, privateMap, value) {
      if (!privateMap.has(receiver)) {
        throw new TypeError("attempted to set private field on non-instance");
      }

      privateMap.set(receiver, value);
      return value;
    }
    /***/

  },

  /***/
  "./src/app/app-routing.module.ts":
  /*!***************************************!*\
    !*** ./src/app/app-routing.module.ts ***!
    \***************************************/

  /*! exports provided: AppRoutingModule */

  /***/
  function srcAppAppRoutingModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function () {
      return AppRoutingModule;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");
    /* harmony import */


    var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! @angular/router */
    "./node_modules/@angular/router/fesm2015/router.js");
    /* harmony import */


    var _common_common_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./common/common.module */
    "./src/app/common/common.module.ts");

    var routes = [{
      path: 'common',
      loadChildren: function loadChildren() {
        return _common_common_module__WEBPACK_IMPORTED_MODULE_3__["MyCommonModule"];
      }
    }];

    var AppRoutingModule = function AppRoutingModule() {
      _classCallCheck(this, AppRoutingModule);
    };

    AppRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
      imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forRoot(routes)],
      exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
    })], AppRoutingModule);
    /***/
  },

  /***/
  "./src/app/app.component.css":
  /*!***********************************!*\
    !*** ./src/app/app.component.css ***!
    \***********************************/

  /*! exports provided: default */

  /***/
  function srcAppAppComponentCss(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2FwcC5jb21wb25lbnQuY3NzIn0= */";
    /***/
  },

  /***/
  "./src/app/app.component.ts":
  /*!**********************************!*\
    !*** ./src/app/app.component.ts ***!
    \**********************************/

  /*! exports provided: AppComponent */

  /***/
  function srcAppAppComponentTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "AppComponent", function () {
      return AppComponent;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");

    var AppComponent = function AppComponent() {
      _classCallCheck(this, AppComponent);

      this.title = 'angular-web';
    };

    AppComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
      selector: 'app-root',
      template: tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! raw-loader!./app.component.html */
      "./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html"))["default"],
      styles: [tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! ./app.component.css */
      "./src/app/app.component.css"))["default"]]
    })], AppComponent);
    /***/
  },

  /***/
  "./src/app/app.module.ts":
  /*!*******************************!*\
    !*** ./src/app/app.module.ts ***!
    \*******************************/

  /*! exports provided: AppModule */

  /***/
  function srcAppAppModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "AppModule", function () {
      return AppModule;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/platform-browser */
    "./node_modules/@angular/platform-browser/fesm2015/platform-browser.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");
    /* harmony import */


    var _app_routing_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./app-routing.module */
    "./src/app/app-routing.module.ts");
    /* harmony import */


    var _app_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ./app.component */
    "./src/app/app.component.ts");

    var AppModule = function AppModule() {
      _classCallCheck(this, AppModule);
    };

    AppModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_2__["NgModule"])({
      declarations: [_app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]],
      imports: [_angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__["BrowserModule"], _app_routing_module__WEBPACK_IMPORTED_MODULE_3__["AppRoutingModule"]],
      providers: [],
      bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]]
    })], AppModule);
    /***/
  },

  /***/
  "./src/app/common/common-routing.module.ts":
  /*!*************************************************!*\
    !*** ./src/app/common/common-routing.module.ts ***!
    \*************************************************/

  /*! exports provided: CommonRoutingModule */

  /***/
  function srcAppCommonCommonRoutingModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "CommonRoutingModule", function () {
      return CommonRoutingModule;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");
    /* harmony import */


    var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! @angular/router */
    "./node_modules/@angular/router/fesm2015/router.js");
    /* harmony import */


    var _template_index_template_index_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./template-index/template-index.component */
    "./src/app/common/template-index/template-index.component.ts");
    /* harmony import */


    var _template_index2_template_index2_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ./template-index2/template-index2.component */
    "./src/app/common/template-index2/template-index2.component.ts");

    var routes = [{
      path: 'templateIndex',
      component: _template_index_template_index_component__WEBPACK_IMPORTED_MODULE_3__["TemplateIndexComponent"]
    }, {
      path: 'templateIndex2',
      component: _template_index2_template_index2_component__WEBPACK_IMPORTED_MODULE_4__["TemplateIndex2Component"]
    }];

    var CommonRoutingModule = function CommonRoutingModule() {
      _classCallCheck(this, CommonRoutingModule);
    };

    CommonRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
      imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forChild(routes)],
      exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
    })], CommonRoutingModule);
    /***/
  },

  /***/
  "./src/app/common/common.module.ts":
  /*!*****************************************!*\
    !*** ./src/app/common/common.module.ts ***!
    \*****************************************/

  /*! exports provided: MyCommonModule */

  /***/
  function srcAppCommonCommonModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "MyCommonModule", function () {
      return MyCommonModule;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");
    /* harmony import */


    var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! @angular/common */
    "./node_modules/@angular/common/fesm2015/common.js");
    /* harmony import */


    var _common_routing_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./common-routing.module */
    "./src/app/common/common-routing.module.ts");
    /* harmony import */


    var _template_index_template_index_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ./template-index/template-index.component */
    "./src/app/common/template-index/template-index.component.ts");
    /* harmony import */


    var _template_index2_template_index2_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(
    /*! ./template-index2/template-index2.component */
    "./src/app/common/template-index2/template-index2.component.ts");

    var MyCommonModule = function MyCommonModule() {
      _classCallCheck(this, MyCommonModule);
    };

    MyCommonModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
      declarations: [_template_index_template_index_component__WEBPACK_IMPORTED_MODULE_4__["TemplateIndexComponent"], _template_index2_template_index2_component__WEBPACK_IMPORTED_MODULE_5__["TemplateIndex2Component"]],
      imports: [_angular_common__WEBPACK_IMPORTED_MODULE_2__["CommonModule"], _common_routing_module__WEBPACK_IMPORTED_MODULE_3__["CommonRoutingModule"]]
    })], MyCommonModule);
    /***/
  },

  /***/
  "./src/app/common/template-index/template-index.component.css":
  /*!********************************************************************!*\
    !*** ./src/app/common/template-index/template-index.component.css ***!
    \********************************************************************/

  /*! exports provided: default */

  /***/
  function srcAppCommonTemplateIndexTemplateIndexComponentCss(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2NvbW1vbi90ZW1wbGF0ZS1pbmRleC90ZW1wbGF0ZS1pbmRleC5jb21wb25lbnQuY3NzIn0= */";
    /***/
  },

  /***/
  "./src/app/common/template-index/template-index.component.ts":
  /*!*******************************************************************!*\
    !*** ./src/app/common/template-index/template-index.component.ts ***!
    \*******************************************************************/

  /*! exports provided: TemplateIndexComponent */

  /***/
  function srcAppCommonTemplateIndexTemplateIndexComponentTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "TemplateIndexComponent", function () {
      return TemplateIndexComponent;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");

    var TemplateIndexComponent = /*#__PURE__*/function () {
      function TemplateIndexComponent() {
        _classCallCheck(this, TemplateIndexComponent);
      }

      _createClass(TemplateIndexComponent, [{
        key: "ngOnInit",
        value: function ngOnInit() {}
      }]);

      return TemplateIndexComponent;
    }();

    TemplateIndexComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
      selector: 'app-template-index',
      template: tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! raw-loader!./template-index.component.html */
      "./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index/template-index.component.html"))["default"],
      styles: [tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! ./template-index.component.css */
      "./src/app/common/template-index/template-index.component.css"))["default"]]
    })], TemplateIndexComponent);
    /***/
  },

  /***/
  "./src/app/common/template-index2/template-index2.component.css":
  /*!**********************************************************************!*\
    !*** ./src/app/common/template-index2/template-index2.component.css ***!
    \**********************************************************************/

  /*! exports provided: default */

  /***/
  function srcAppCommonTemplateIndex2TemplateIndex2ComponentCss(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony default export */


    __webpack_exports__["default"] = "\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2NvbW1vbi90ZW1wbGF0ZS1pbmRleDIvdGVtcGxhdGUtaW5kZXgyLmNvbXBvbmVudC5jc3MifQ== */";
    /***/
  },

  /***/
  "./src/app/common/template-index2/template-index2.component.ts":
  /*!*********************************************************************!*\
    !*** ./src/app/common/template-index2/template-index2.component.ts ***!
    \*********************************************************************/

  /*! exports provided: TemplateIndex2Component */

  /***/
  function srcAppCommonTemplateIndex2TemplateIndex2ComponentTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "TemplateIndex2Component", function () {
      return TemplateIndex2Component;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");

    var TemplateIndex2Component = /*#__PURE__*/function () {
      function TemplateIndex2Component() {
        _classCallCheck(this, TemplateIndex2Component);
      }

      _createClass(TemplateIndex2Component, [{
        key: "ngOnInit",
        value: function ngOnInit() {}
      }]);

      return TemplateIndex2Component;
    }();

    TemplateIndex2Component = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
      selector: 'app-template-index2',
      template: tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! raw-loader!./template-index2.component.html */
      "./node_modules/raw-loader/dist/cjs.js!./src/app/common/template-index2/template-index2.component.html"))["default"],
      styles: [tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(
      /*! ./template-index2.component.css */
      "./src/app/common/template-index2/template-index2.component.css"))["default"]]
    })], TemplateIndex2Component);
    /***/
  },

  /***/
  "./src/environments/environment.ts":
  /*!*****************************************!*\
    !*** ./src/environments/environment.ts ***!
    \*****************************************/

  /*! exports provided: environment */

  /***/
  function srcEnvironmentsEnvironmentTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "environment", function () {
      return environment;
    });
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js"); // This file can be replaced during build by using the `fileReplacements` array.
    // `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
    // The list of file replacements can be found in `angular.json`.


    var environment = {
      production: false
    };
    /*
     * For easier debugging in development mode, you can import the following file
     * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
     *
     * This import should be commented out in production mode because it will have a negative impact
     * on performance if an error is thrown.
     */
    // import 'zone.js/dist/zone-error';  // Included with Angular CLI.

    /***/
  },

  /***/
  "./src/main.ts":
  /*!*********************!*\
    !*** ./src/main.ts ***!
    \*********************/

  /*! no exports provided */

  /***/
  function srcMainTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony import */


    var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! tslib */
    "./node_modules/tslib/tslib.es6.js");
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/fesm2015/core.js");
    /* harmony import */


    var _angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! @angular/platform-browser-dynamic */
    "./node_modules/@angular/platform-browser-dynamic/fesm2015/platform-browser-dynamic.js");
    /* harmony import */


    var _app_app_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./app/app.module */
    "./src/app/app.module.ts");
    /* harmony import */


    var _environments_environment__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ./environments/environment */
    "./src/environments/environment.ts");

    if (_environments_environment__WEBPACK_IMPORTED_MODULE_4__["environment"].production) {
      Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["enableProdMode"])();
    }

    Object(_angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_2__["platformBrowserDynamic"])().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_3__["AppModule"])["catch"](function (err) {
      return console.error(err);
    });
    /***/
  },

  /***/
  0:
  /*!***************************!*\
    !*** multi ./src/main.ts ***!
    \***************************/

  /*! no static exports found */

  /***/
  function _(module, exports, __webpack_require__) {
    module.exports = __webpack_require__(
    /*! /Applications/MAMP/htdocs/test_web_admin/angular-web/src/main.ts */
    "./src/main.ts");
    /***/
  }
}, [[0, "runtime", "vendor"]]]);
//# sourceMappingURL=main-es5.js.map