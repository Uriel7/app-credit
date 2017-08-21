module RequisitionsHelper
  def setup_requisition(requisition)
    3.times { requisition.personal_references.build } if requisition.id.nil?
    requisition
  end

  def has_select_options
    [['Si', 'true'], ['No', 'false']]
  end

  def marital_status_select_options
    ['Soltero/a', 'Casado/a', 'Viudo/a', 'Divorciado/a', 'Unión Libre', 'Comprometido/a']
  end

  def payment_terms_select_options
    [['6 meses', '6'],['12 meses', '12'], ['18 meses', '18'], ['24 meses', '24'], ['30 meses', '30'], ['36 meses', '36']]
  end

  def object_has(has_attr)
    if has_attr.instance_of? NilClass
      ''
    else 
      has_attr
    end
  end

  def bank_select_options
    [
      'Banco Nacional de México (Banamex)',
      'Banco Santander (México)',
      'HSBC México.',
      'Scotiabank Inverlat.',
      'BBVA Bancomer.',
      'Banco Mercantil del Norte (Banorte).',
      'Banco Interacciones.',
      'Banco Inbursa.',
      'banca Mifel.',
      'Banco Regional de Monterrey.',
      'Banco Invex.',
      'Banco del Bajio.',
      'Bansi.',
      'Banca Afirme.',
      'Bank of America México.',
      'Banco J.P. Morgan.',
      'Banco Ve Por Mas.',
      'American Express Bank (México).',
      'Investa Bank.',
      'CiBanco.',
      'Bank of Tokyo-Mitsubishi UFJ (México).',
      'Banco Monex.',
      'Deutsche Bank México.',
      'Banco Azteca.',
      'Banco Credit Suisse (México).',
      'Banco Autofin México.',
      'Barclays Bank México.',
      'Banco Ahorro Famsa.',
      'Intercam Banco.',
      'ABC Capital. ',
      'Banco Actinver.',
      'Banco Compartamos.',
      'Banco Multiva.',
      'UBS Bank México.',
      'Bancoppel.',
      'ConsuBanco.',
      'Banco Wal-Mart de México.',
      'Volkswagen Bank.',
      'Banco Base.',
      'Banco Pagatodo.',
      'Banco Forjadores.',
      'Bankaool.',
      'Banco Inmobiliario Mexicano.',
      'Fundación Dondé Banco.',
      'Banco Bancrea'
    ]
  end
end
