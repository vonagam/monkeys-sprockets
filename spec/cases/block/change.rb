Monkeys::Changer.tap do | change |

  change.file 'block/input.txt' do | file |

    file.line 3, '4' do | line |

      [ '3', line, '5' ]

    end

    file.line 4, '7' do | line |

      '6'

    end

  end

end
