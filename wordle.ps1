Function Start-PSW{
    #Should start a new game of wordle and prompt for input
    $WordList = Get-Content ./wordle-allowed-guesses.txt
    $Word = New-PSWWord
    [Int]$Attempts = 6
    Write-Host "Welcome to the Wordle game for more option type #help"
    For (1..$Attempts){
        Read-PSW
        
    }
}
Function Read-PSW{
    #Should read input and look for # and interpret as command or read guess and check against word list and word
    $Guess = Read-Host -Prompt "Input Guess #$Guesses"
    if ($Guess.StartsWith('#'){
        switch ($Guess)
        {
            '#help' {Write-Host "Options are #reset, #reminder, #giveup, #exit" }
            '#reset' {Start-PSW}
            '#reminder' {Show-PSWGuesses}
            '#giveup' {$GiveUp = $True}
            Default {Write-Host "Invalid input: Options are #reset, #reminder, #giveup, #exit"}
        }
    }
    elseif ($(Approve-PSWGuess)) {Submit-PSWGuess}
    else {}
}
Function New-PSWWord{
    #Should select a random word from the word list and assign to word
    $WordList | Get-Random
}


Function Submit-PSWGuess {
    #Should Compare guess against existing word and return correct letters/answer
}

Function Approve-PSWGuess{
    if (($Guess -notmatch '[^a-zA-Z]') -and ($Guess.length = 5) -and ($WordList -contains $Guess)){$True}
    else{$False}
}