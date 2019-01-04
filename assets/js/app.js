import Vue from "vue";
import VueRouter from "vue-router";

import "axios";
import search from "./search";
import results from "./results";

Vue.use(VueRouter);

Vue.component("search", search);
Vue.component("results", results);

var router = new VueRouter({
  routes: [
      { path: '/', component: search },
      // { path: '/items/:item_id', component: bid, name: "bid" },
      // { path: '*', redirect: '/' }
  ]
});

new Vue({router}).$mount("#app");