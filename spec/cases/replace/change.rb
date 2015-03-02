Monkeys::Changer.tap do | change |

  change.file 'replace/input.txt' do | file |

    file.line 2, '2', ''

    file.line 5, '5', [ 'before', '5', 'after' ]

  end

end
