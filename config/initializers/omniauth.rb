Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
   'T1rqQjmsDQpST7mmKFLexTDQr',
   'ObMHJIu7O0WUl0UnLADn7mnWhQcra8MPaGl1eIBrO52bNGAMro'
end