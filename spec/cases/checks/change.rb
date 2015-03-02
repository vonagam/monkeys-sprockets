Monkeys::Changer.tap do | change |

  change.file 'checks/input.txt' do | file |

    file.line 1, "hello world\n"
    file.line 2, 'perfection'
    file.line 3, /paradise/

    expect{ file.line 1, "hell world\n" }.to raise_error StandardError
    expect{ file.line 2, 'per ection' }.to raise_error StandardError
    expect{ file.line 3, /par dise/ }.to raise_error StandardError

  end

end
