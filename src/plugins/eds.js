import { EncryptedDatabase } from 'libeds'

export const EDS = new EncryptedDatabase()
export const EDSInitializationPromise = EDS.initialize({
	appID: 'PipedMaterial',
	url: process.env.VUE_APP_EDS_DEV !== 'true' ? 'wss://eds.gra.১.net' : 'ws://localhost:8000'
})
window.EDS = EDS
