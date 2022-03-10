@stages  =('
  +---+
  |   |
  O   |
 \|/  |
  |   |
 / \  |
      |
=========
', '
  +---+
  |   |
  O   |
 \|/  |
  |   |
 /    |
      |
=========
', '
  +---+
  |   |
  O   |
 \|/  |
  |   |
      |
      |
=========
', '
  +---+
  |   |
  O   |
 \|   |
  |   |
      |
      |
=========', '
  +---+
  |   |
  O   |
  |   |
  |   |
      |
      |
=========
', '
  +---+
  |   |
  O   |
  |   |
      |
      |
      |
=========
', '
  +---+
  |   |
  O   |
      |
      |
      |
      |
=========
','
  +---+
  |   |
      |
      |
      |
      |
      |
=========
'
);

@text = ();
for (my $x=0; $x < 8; $x++){
    push @text,"You have $x body parts left \n";
}


@words=("computer", "radio", "calculator", "teacher", "bureau", "police", "geometry", "president", "subject", "country", "enviroment", "classroom", "animals", "province", "month", "politics", "puzzle", "instrument", "kitchen", "language", "vampire", "ghost", "solution", "service", "software", "virus", "security", "phonenumber", "expert", "website", "agreement", "support", "compatibility", "advanced", "search", "triathlon", "immediately", "encyclopedia", "endurance", "distance", "nature", "history", "organization", "international", "championship", "government", "popularity", "thousand", "feature", "wetsuit", "fitness", "legendary", "variation", "equal", "approximately", "segment", "priority", "physics", "branche", "science", "mathematics", "lightning", "dispersion", "accelerator", "detector", "terminology", "design", "operation", "foundation", "application", "prediction", "reference", "measurement", "concept", "perspective", "overview", "position", "airplane", "symmetry", "dimension", "toxic", "algebra", "illustration", "classic", "verification", "citation", "unusual", "resource", "analysis", "license", "comedy", "screenplay", "production", "release", "emphasis", "director", "trademark", "vehicle", "aircraft", "experiment");

$word = $words[ rand @words ];
$size = length($word);


$win = 0;
$lose = 0;
$body_parts = 7;

@current = ();
$i=0;
while ($i<$size){
push @current,'_';
$i++;
}


while($win==0 && $lose==0 ){
    
    print "Guess a letter of the word :";
    $letter = <STDIN>;
    $letter = lc($letter);
    chop($letter);

      
    if(check($word,$letter)){
        if ((grep $_ eq $letter, @current)){
            print("You have guessed this. \n");
        }
        else{
            for (my $index=0; $index < length($word); $index++) {
                my $c_letter = substr($word, $index, 1);
                if ($letter eq $c_letter) {
                   $current [$index] = $c_letter;
                }
            }
        }
    }
    else{
        print("Guessed letter not in word. \n");
        $body_parts = $body_parts-1;
        if ($body_parts==0){
            $lose=1;
       
        }
    }
    print(@current);
    print("\n");


    if (!(grep $_ eq '_', @current)){
        $win=1;
    }
    
    print(@stages[$body_parts]);
    print(@text[$body_parts]);
    
    print("\n");
      
}

if($lose){
    print(" \n YOU LOSE .\n The correct word was $word \n");
}

if($win){
    print("YOU WIN !! \n");
}

sub check {
    my ($given_word ,$guess) = @_;
    $ind = index($given_word, $guess);
    if ($ind==-1){
        return 0;
    }
    else{
        return 1;
    }
}

