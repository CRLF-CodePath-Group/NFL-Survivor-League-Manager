//
//  Team.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/23/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
enum Team: String{
    //NFC SOUTH
    case ATLANTA = "Falcons"; case PANTHERS = "Panthers"; case SAINTS = "Saints"; case BUCCANEERS = "Buccaneers"
    
    //NFC NORTH
    case PACKERS = "Packers"; case VIKINGS = "Vikings"; case BEARS = "Bears"; case LIONS = "Lions"
    
    //NFC WEST
    case SEAHAWKS = "Seahawks"; case FORTY_NINERS = "49ers"; case RAMS = "Rams"; case CARDINALS = "Cardinals"
    
    //NFC EAST
    case COWBOYS = "Cowboys"; case GIANTS = "Giants"; case EAGLES = "Eagles"; case REDSKINS = "Redskins"
    
    //AFC EAST
    case PATRIOTS = "Patriots"; case BILLS = "Bills"; case JETS = "Jets"; case DOLPHINS = "Dolphins"
    
    //AFC WEST
    case BRONCOS = "Broncos"; case RAIDERS = "Raiders"; case CHIEFS = "Chiefs"; case CHARGERS = "Chargers"
    
    //AFC SOUTH
    case TITANS = "Titans"; case COLTS = "Colts"; case JAGUARS = "Jaguars"; case TEXANS = "Texans"
    
    //AFC NORTH
    case BROWNS = "Browns"; case STEELERS = "Steelers"; case RAVENS = "Ravens"; case BENGALS = "Bengals"
    
    //NIL CASE
    case NIL = "NIL"
    
    
    static func getTeamByAbbreviation(_ abb : String) -> Team{
        if abb == "ATL" { return Team.ATLANTA      }
        if abb == "CAR" { return Team.PANTHERS     }
        if abb == "NO"  { return Team.SAINTS       }
        if abb == "TB"  { return Team.BUCCANEERS   }
        if abb == "GB"  { return Team.PACKERS      }
        if abb == "DET" { return Team.LIONS        }
        if abb == "MIN" { return Team.VIKINGS      }
        if abb == "CHI" { return Team.BEARS        }
        if abb == "SF"  { return Team.FORTY_NINERS }
        if abb == "LA"  { return Team.RAMS         }
        if abb == "SEA" { return Team.SEAHAWKS     }
        if abb == "ARI" { return Team.CARDINALS    }
        if abb == "WAS" { return Team.REDSKINS     }
        if abb == "PHI" { return Team.EAGLES       }
        if abb == "NYG" { return Team.GIANTS       }
        if abb == "DAL" { return Team.COWBOYS      }
        if abb == "NE"  { return Team.PATRIOTS     }
        if abb == "NYJ" { return Team.JETS         }
        if abb == "BUF" { return Team.BILLS        }
        if abb == "MIA" { return Team.DOLPHINS     }
        if abb == "DEN" { return Team.BRONCOS      }
        if abb == "OAK" { return Team.RAIDERS      }
        if abb == "KC"  { return Team.CHIEFS       }
        if abb == "LAC" { return Team.CHARGERS     }
        if abb == "HOU" { return Team.TEXANS       }
        if abb == "JAX" { return Team.JAGUARS      }
        if abb == "IND" { return Team.COLTS        }
        if abb == "TEN" { return Team.TITANS       }
        if abb == "BAL" { return Team.RAVENS       }
        if abb == "CLE" { return Team.BROWNS       }
        if abb == "PIT" { return Team.STEELERS     }
        if abb == "CIN" { return Team.BENGALS      }
        return Team.NIL
    }
}
