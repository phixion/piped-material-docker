import Vue from 'vue'
import App from './App.vue'

import 'antar-hinted/antar.css'
import '@/styles/main.scss'

import { i18n, initializeLocalLocale } from '@/plugins/i18n'
import vuetify from '@/plugins/vuetify'
import store from '@/store'
import { syncPMDB } from '@/store/watched-videos-db'
import router from '@/router'

import './registerServiceWorker'
import { EDSInitializationPromise } from '@/plugins/eds'

Vue.config.productionTip = false

EDSInitializationPromise
	.then(() => Promise.all([
		syncPMDB(),
		store.dispatch('prefs/loadState'),
		store.dispatch('auth/initializeAuth'),
		initializeLocalLocale()
	]))
	.then(() => {
		new Vue({
			vuetify,
			i18n,
			store,
			router,
			render: h => h(App)
		}).$mount('#app')
	})
