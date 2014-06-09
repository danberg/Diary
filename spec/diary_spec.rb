require 'rspec'
require 'fakefs/safe'

require_relative '../lib/diary'

describe 'create_diary_submission_file' do

  it 'should take a path and a diary name as argument' do
    expect { create_diary_submission() }.to raise_error ArgumentError
    expect { create_diary_submission('one_argument') }.to raise_error ArgumentError
  end

  it 'should create a .diary file with the correct format' do
    FakeFS do
      expect(Dir.glob('*.diary')).not_to include(/Aurgh, I do not like this assignment.diary/)
      expect(Dir.glob('*.diary')).not_to include(/Blerf, another test/)

      create_diary_submission('.', 'Aurgh, I do not like this assignment')
      expect(Dir.glob('*.diary')).to include(/Aurgh, I do not like this assignment.diary/)
      create_diary_submission('.', 'Blerf, another test')
      expect(Dir.glob('*.diary')).to include(/Blerf, another test/)

    end
  end

  it 'should raise ArgumentError with correct error message if folder does not exist' do
    expect { create_diary_submission('nonexisting_path', 'somefile.diary') }.to raise_error ArgumentError, 'folder does not exist'
  end

  it 'should raise ArgumentError with correct error message if file already exists' do
    expect { create_diary_submission('spec/entries', 'My First Submission') }.to raise_error ArgumentError, 'file already exists'
  end

  it 'should return the created File Object' do
    FakeFS do
      file = create_diary_submission('.', 'A title')
      expect(file).to be_an_instance_of File
      expect(file.path).to match './A title.diary'
    end
  end

end

describe 'write_to_diary' do

  it 'should take a path to a diary file and a text string as arguments' do
    FakeFS do
      create_diary_submission('.', 'just a temporary file')
      expect { write_to_diary('just a temporary file.diary', 'nonsense') }.not_to raise_error
    end
  end

  it 'should raise ArgumentError if diary file does not exist' do
    FakeFS do
      expect { write_to_diary('entries/nonexisting.diary', 'nonsense') }.to raise_error ArgumentError, 'file does not exist'
      expect { write_to_diary('nonexisting_folder/My First Submission.diary', 'nonsense')}.to raise_error ArgumentError, 'file does not exist'
    end
  end

  it 'should raise ArgumentError if the text string is empty' do
    FakeFS do
      expect { write_to_diary('./just a temporary file.diary', '') }.to raise_error ArgumentError, 'can not write empty string'
    end
  end

  it 'should write the contents of the text string to the file' do
    FakeFS do
      write_to_diary('just a temporary file.diary', "Just typing away here, really...\nlets add a line\nbreak")
      expect(File.readlines('just a temporary file.diary')).to match_array ["Just typing away here, really...\n", "lets add a line\n", "break\n"]
    end
  end

end

describe 'create_diary_list' do

  it 'should take a path to a folder as a argument' do
    expect { create_diary_list() }.to raise_error ArgumentError
  end

  it 'should return an array of the paths all diary files' do
    expect(create_diary_list('spec/entries')).to match_array ['spec/entries/My First Submission.diary', 'spec/entries/Another Entry.diary']
  end

  it 'should raise ArgumentError if path does not exist' do
    expect { create_diary_list('nonexisting_path') }.to raise_error ArgumentError, 'path does not exist'
  end
end

describe 'print_diary_list' do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  it 'should take an array of diary file paths as argument'  do
    expect { print_diary_list() }.to raise_error ArgumentError
  end

  it 'should print an enumerated list of all the files, nicely formatted' do
    print_diary_list(['spec/entries/My First Submission.diary', 'spec/entries/Another Entry.diary'])
    expect($stdout.string).to match "1: My First Submission\n2: Another Entry\n"
  end

  it 'should print "No diary files found" if the array of file paths is empty' do
    print_diary_list([])
    expect($stdout.string).to match "No diary files found"
  end

end


describe 'print_diary' do

  it 'should take a path to a diary file as an argument' do
    expect { print_diary()}.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with correct error message if path is nil' do
    expect { print_diary(nil) }.to raise_error ArgumentError, 'no path supplied'
  end

  it 'should raise ArgumentError with correct error message if file does not exist' do
    expect { print_diary('spec/entries/nonexisting.diary')}.to raise_error ArgumentError, 'file does not exist'
  end

  it 'should print the title of the diary followed by a blank line and the contents' do
    $stdout = StringIO.new
      print_diary('spec/entries/My First Submission.diary')
      expect($stdout.string).to match "My First Submission\n\nDear Diary...\nThis is the first of the entries.\n"
    $stdout = STDOUT
  end


end