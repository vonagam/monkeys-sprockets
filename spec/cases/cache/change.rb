Monkeys::Changer.tap do | change |

  # this block will be called

  change.file 'cache/input.txt' do | file |

    file.line 1, '1', '2'

  end

  # this will not

  # becase file 'monkeys/cache/input.txt' depend on two files
  # on a file 'saces/cache/input.txt'
  # and
  # on this file, the file, where a Mokeys::Filer instance created

  # because both of them are older then 'monkeys/cache/input.txt'
  # patching will not be executed

  change.file 'cache/input.txt' do | file |

    file.line 1, '1', '3'

  end

end
